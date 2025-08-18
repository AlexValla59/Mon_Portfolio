(() => {
"use strict";

/* ==== CONFIG ==== */
const CONTAINER_ID       = "hero-puzzle";
const NB_PIECES          = 12;
const SHOW_DURATION      = 2600;     // durée d'affichage du visuel complet avant la chute
const RESTART_DELAY_MS   = 60000;    // 30 secondes de jeu
const RESTART_BTN_ID     = "puzzle-restart";
const TIMER_ID           = "puzzle-timer";
const LOCK_ID            = "puzzle-lock";
const MSG_ID             = "puzzle-message"; // <<< AJOUT
const PLAYFIELD_INSET = 24; // marge (px) tout autour à l’intérieur du puzzle

/* ================= */

/* ==== utils numériques ==== */
const R=Math.random,H=Math.hypot,F=Math.floor,A=Math.abs,M=Math.min,X=Math.max;
const alea=(a,b)=> b==undefined? a*R(): a+(b-a)*R();
const intAlea=(a,b)=>{ if(b==undefined){b=a;a=0} return F(a+(b-a)*R()); };
const arrayShuffle=a=>{ for(let k=a.length-1;k>=1;--k){const i=intAlea(0,k+1);[a[k],a[i]]=[a[i],a[k]]} return a };
/* =========================== */

/* ==== rAF / timers ==== */
let _rafId = null;
let _timeouts = [];
let _intervals = [];

const schedule = (fn, delay) => { const id=setTimeout(fn,delay); _timeouts.push(id); return id; };
const scheduleInterval = (fn, every) => { const id=setInterval(fn,every); _intervals.push(id); return id; };
const clearAllTimers = () => {
  if(_rafId!=null){ cancelAnimationFrame(_rafId); _rafId=null; }
  _timeouts.forEach(clearTimeout);  _timeouts=[];
  _intervals.forEach(clearInterval); _intervals=[];
};
/* ======================= */

/* ==== Styles injectés ==== */
function injectStylesOnce(){
  if (document.getElementById("__puzzle_css__")) return;
  const st = document.createElement("style");
  st.id = "__puzzle_css__";
  st.textContent = `

/* Timer centré au-dessus du puzzle, offset piloté par --timer-offset */
#${TIMER_ID}{
  position:absolute;
  left:50%;
  top:0;
  transform: translate(-50%, calc(-100% + var(--timer-offset, 0px)));
  z-index:10001;
  padding:6px 10px; border-radius:8px;
  background:rgba(0,0,0,.6); color:#fff; font:600 14px/1.2 system-ui, sans-serif;
  letter-spacing:.5px; display:none;
}


    
  /* <<< AJOUT : style "danger" pour les 10 dernières secondes >>> */
  #${TIMER_ID}.danger{
    background: rgba(255,0,0,.12);
    color: #ff2d2d;
  }
    /* Bouton centré */
    #${RESTART_BTN_ID}{
      position:absolute; left:50%; top:50%; transform:translate(-50%,-50%);
      z-index:10003; padding:10px 18px; border-radius:10px; border:0; cursor:pointer;
      background:#fff; color:#111; font:600 16px system-ui, sans-serif;
      box-shadow:0 6px 16px rgba(0,0,0,.15); display:none;
    }
    /* Overlay de blocage d'interactions (sous le bouton) */
    #${LOCK_ID}{
      position:absolute; inset:0; z-index:10002; pointer-events:auto;
      background:rgba(0,0,0,0); display:none;
    }

    /* <<< AJOUT : message de statut (succès/échec) >>> */
    #${MSG_ID}{
      position:absolute; left:50%; top:30%;
      transform:translate(-50%,-50%);
      z-index:10004;
      padding:12px 18px; border-radius:12px;
      background:rgba(0,0,0,.75); color:#fff;
      font:700 18px/1.2 system-ui, sans-serif;
      letter-spacing:.4px;
      display:none; pointer-events:none;
      box-shadow:0 8px 24px rgba(0,0,0,.25);
    }
  `;
  document.head.appendChild(st);
}
/* ========================= */

/* ==== UI helpers ==== */
function ensureUI(container){
  // cible la colonne de droite si elle existe
  const host = container.closest('.apropos-puzzle') || container.parentElement || container;

  let timer = document.getElementById(TIMER_ID);
  if(!timer){
    timer = document.createElement("div");
    timer.id = TIMER_ID;
    host.appendChild(timer);           // ⬅️ le timer vit dans la colonne de droite
  }

}


  let btn = document.getElementById(RESTART_BTN_ID);
  if(!btn){ 
    btn=document.createElement("button"); 
    btn.id=RESTART_BTN_ID; 
    btn.type="button"; 
    btn.textContent="Restart"; 
    container.appendChild(btn); 

    // ✅ Fix iOS : capter aussi les taps tactiles
    btn.addEventListener("touchstart", (e)=>{
      e.preventDefault();   // évite double-événement
      btn.click();          // déclenche le click classique
    }, {passive:false});
  }

  let lock = document.getElementById(LOCK_ID);
  if(!lock){ 
    lock=document.createElement("div"); 
    lock.id=LOCK_ID; 
    container.appendChild(lock); 
  }

  // <<< AJOUT : élément message (succès/échec) >>>
  let msg = document.getElementById(MSG_ID);
  if(!msg){ 
    msg=document.createElement("div"); 
    msg.id=MSG_ID; 
    container.appendChild(msg); 
  }

  return { timer, btn, lock, msg };
}

function formatMMSS(ms){
  const s = Math.max(0, Math.ceil(ms/1000));
  const mm = String(Math.floor(s/60)).padStart(2,"0");
  const ss = String(s%60).padStart(2,"0");
  return `${mm}:${ss}`;
}
// <<< AJOUT : helper affichage message éphémère
function showMessage(el, text, duration=3000){
  el.textContent = text;
  el.style.display = "block";
  schedule(() => { el.style.display = "none"; }, duration);
}
/* ======================= */

/* ==== Image ==== */
function getImageURL() {
  const el = document.getElementById(CONTAINER_ID);
  return el?.dataset?.imageUrl || "18.png";
}
/* ============== */

class Point{constructor(x,y){this.x=+x;this.y=+y}}
class Segment{constructor(p1,p2){this.p1=new Point(p1.x,p1.y);this.p2=new Point(p2.x,p2.y)} dx(){return this.p2.x-this.p1.x} dy(){return this.p2.y-this.p1.y} pointOnRelative(c){return new Point(this.p1.x+c*this.dx(),this.p1.y+c*this.dy())}}
class Side{
  constructor(){this.type="";this.points=[]}
  reversed(){const s=new Side();s.type=this.type;s.points=this.points.slice().reverse();return s}
  scale(p){const cx=p.scalex,cy=p.scaley;this.scaledPoints=this.points.map(pt=>new Point(pt.x*cx,pt.y*cy))}
  drawPath(ctx,dx,dy,withoutMoveTo){
    if(!withoutMoveTo) ctx.moveTo(this.scaledPoints[0].x+dx,this.scaledPoints[0].y+dy);
    if(this.type=="d") ctx.lineTo(this.scaledPoints[1].x+dx,this.scaledPoints[1].y+dy);
    else for(let k=1;k<this.scaledPoints.length-1;k+=3)
      ctx.bezierCurveTo(
        this.scaledPoints[k].x+dx,this.scaledPoints[k].y+dy,
        this.scaledPoints[k+1].x+dx,this.scaledPoints[k+1].y+dy,
        this.scaledPoints[k+2].x+dx,this.scaledPoints[k+2].y+dy
      );
  }
}
/* shape "classic" */
function twistClassic(side, ca, cb){
  const seg0=new Segment(side.points[0],side.points[1]),
        dxh=seg0.dx(), dyh=seg0.dy(),
        mid0=seg0.pointOnRelative(.5),
        mid1=new Segment(ca,cb).pointOnRelative(.5),
        segMid=new Segment(mid0,mid1), dxv=segMid.dx(), dyv=segMid.dy(),
        scalex=alea(.8,1), scaley=alea(.9,1), mid=alea(.45,.55);
  const p=(ch,cv)=>new Point(seg0.p1.x+ch*dxh+cv*dxv, seg0.p1.y+ch*dyh+cv*dyv);
  const pa=p(mid-1/12*scalex,1/12*scaley),
        pb=p(mid-2/12*scalex,3/12*scaley),
        pc=p(mid,4/12*scaley),
        pd=p(mid+2/12*scalex,3/12*scaley),
        pe=p(mid+1/12*scalex,1/12*scaley);
  side.points=[seg0.p1,
    new Point(seg0.p1.x+5/12*dxh*.52, seg0.p1.y+5/12*dyh*.52),
    new Point(pa.x-1/12*dxv*.72, pa.y-1/12*dyv*.72), pa,
    new Point(pa.x+1/12*dxv*.72, pa.y+1/12*dyv*.72),
    new Point(pb.x-1/12*dxv*.92, pb.y-1/12*dyv*.92), pb,
    new Point(pb.x+1/12*dxv*.52, pb.y+1/12*dyv*.52),
    new Point(pc.x-2/12*dxh*.40, pc.y-2/12*dyh*.40), pc,
    new Point(pc.x+2/12*dxh*.40, pc.y+2/12*dyh*.40),
    new Point(pd.x+1/12*dxv*.52, pd.y+1/12*dyv*.52), pd,
    new Point(pd.x-1/12*dxv*.92, pd.y-1/12*dyv*.92),
    new Point(pe.x+1/12*dxv*.72, pe.y+1/12*dyv*.72), pe,
    new Point(pe.x-1/12*dxv*.72, pe.y-1/12*dyv*.72),
    new Point(seg0.p2.x-5/12*dxh*.52, seg0.p2.y-5/12*dyh*.52),
    seg0.p2
  ];
  side.type="z";
}

class Piece{constructor(kx,ky){this.ts=new Side();this.rs=new Side();this.bs=new Side();this.ls=new Side();this.kx=kx;this.ky=ky} scale(p){this.ts.scale(p);this.rs.scale(p);this.bs.scale(p);this.ls.scale(p)}}

class PolyPiece{
  constructor(p0,p){this.pckxmin=p0.kx;this.pckxmax=p0.kx+1;this.pckymin=p0.ky;this.pckymax=p0.ky+1;this.pieces=[p0];this.puzzle=p;this.listLoops();
    this.canvas=document.createElement("canvas"); p.container.appendChild(this.canvas);
    this.canvas.className="polypiece"; this.ctx=this.canvas.getContext("2d");}
  merge(o){
    const ox=this.pckxmin,oy=this.pckymin;
    const ko=this.puzzle.polyPieces.indexOf(o); this.puzzle.polyPieces.splice(ko,1); this.puzzle.container.removeChild(o.canvas);
    for(const pc of o.pieces){ this.pieces.push(pc);
      if(pc.kx<this.pckxmin)this.pckxmin=pc.kx; if(pc.kx+1>this.pckxmax)this.pckxmax=pc.kx+1;
      if(pc.ky<this.pckymin)this.pckymin=pc.ky; if(pc.ky+1>this.pckymax)this.pckymax=pc.ky+1; }
    this.pieces.sort((a,b)=>a.ky-b.ky||a.kx-b.kx); this.listLoops(); this.drawImage();
    this.moveTo(this.x+this.puzzle.scalex*(this.pckxmin-ox), this.y+this.puzzle.scaley*(this.pckymin-oy));
    this.puzzle.evaluateZIndex();
  }
  ifNear(o){
    const p=this.puzzle;
    let x=this.x-p.scalex*this.pckxmin, y=this.y-p.scaley*this.pckymin,
        px=o.x-p.scalex*o.pckxmin, py=o.y-p.scaley*o.pckymin;
    if(H(x-px,y-py)>=p.dConnect) return false;
    for(let p1 of this.pieces) for(let p2 of o.pieces){
      if(p1.kx==p2.kx && A(p1.ky-p2.ky)==1) return true;
      if(p1.ky==p2.ky && A(p1.kx-p2.kx)==1) return true;
    }
    return false;
  }
  listLoops(){
    const that=this;
    const common=(kx,ky,e)=>{ if(e==0)ky--; else if(e==1)kx++; else if(e==2)ky++; else kx--;
      return that.pieces.some(p=>p.kx==kx && p.ky==ky); };
    const idx=(kx,ky,e)=>{ for(let i=0;i<tb.length;i++){const t=tb[i]; if(t.kx==kx&&t.ky==ky&&t.edge==e) return i;} return false;}
    let tb=[]; for(let p of this.pieces) for(let e=0;e<4;e++) if(!common(p.kx,p.ky,e)) tb.push({kx:p.kx,ky:p.ky,edge:e,kp:this.pieces.indexOf(p)});
    const tries=[[{dkx:0,dky:0,edge:1},{dkx:1,dky:0,edge:0},{dkx:1,dky:-1,edge:3}],
                 [{dkx:0,dky:0,edge:2},{dkx:0,dky:1,edge:1},{dkx:1,dky:1,edge:0}],
                 [{dkx:0,dky:0,edge:3},{dkx:-1,dky:0,edge:2},{dkx:-1,dky:1,edge:1}],
                 [{dkx:0,dky:0,edge:0},{dkx:0,dky:-1,edge:3},{dkx:-1,dky:-1,edge:2}]];
    let loops=[];
    while(tb.length){
      let lp=[], cur=tb[0]; lp.push(cur); tb.splice(0,1);
      while(1){
        let found=false;
        for(let t=0;t<3;t++){ const n=tries[cur.edge][t], k=idx(cur.kx+n.dkx,cur.ky+n.dky,n.edge);
          if(k===false) continue; cur=tb[k]; lp.push(cur); tb.splice(k,1); found=true; break; }
        if(!found) break;
      }
      loops.push(lp);
    }
    this.tbLoops=loops.map(loop=>loop.map(e=>{
      const c=this.pieces[e.kp]; return e.edge==0?c.ts:e.edge==1?c.rs:e.edge==2?c.bs:c.ls;
    }));
  }
  drawPath(ctx,dx,dy){ this.tbLoops.forEach(loop=>{let w=false; loop.forEach(s=>{s.drawPath(ctx,dx,dy,w); w=true;}); ctx.closePath(); }); }
  drawImage(){
    const p=this.puzzle;
    this.nx=this.pckxmax-this.pckxmin+1; this.ny=this.pckymax-this.pckymin+1;
    this.canvas.width=this.nx*p.scalex; this.canvas.height=this.ny*p.scaley;
    this.offsx=(this.pckxmin-.5)*p.scalex; this.offsy=(this.pckymin-.5)*p.scaley;
    this.path=new Path2D(); this.drawPath(this.path,-this.offsx,-this.offsy);

    const c=this.ctx;
    c.fillStyle='none'; c.shadowColor='rgba(0,0,0,.5)'; c.shadowBlur=4; c.shadowOffsetX=4; c.shadowOffsetY=4; c.fill(this.path);
    c.shadowColor='rgba(0,0,0,0)';

    this.pieces.forEach(pp=>{
      c.save();
      const path=new Path2D(), dx=-this.offsx, dy=-this.offsy;
      pp.ts.drawPath(path,dx,dy,false); pp.rs.drawPath(path,dx,dy,true); pp.bs.drawPath(path,dx,dy,true); pp.ls.drawPath(path,dx,dy,true);
      path.closePath(); c.clip(path);

      const srcx = pp.kx ? ((pp.kx - .5)*p.scalex) : 0;
      const srcy = pp.ky ? ((pp.ky - .5)*p.scaley) : 0;
      const destx = (pp.kx ? 0 : p.scalex/2) + (pp.kx - this.pckxmin)*p.scalex;
      const desty = (pp.ky ? 0 : p.scaley/2) + (pp.ky - this.pckymin)*p.scaley;
      let w=2*p.scalex, h=2*p.scaley;
      if(srcx+w>p.gameCanvas.width) w=p.gameCanvas.width-srcx;
      if(srcy+h>p.gameCanvas.height) h=p.gameCanvas.height-srcy;
      c.drawImage(p.gameCanvas, srcx,srcy,w,h, destx,desty,w,h);

      c.translate(p.embossThickness/2,-p.embossThickness/2); c.lineWidth=p.embossThickness; c.strokeStyle="rgba(0,0,0,.1)"; c.stroke(path);
      c.translate(-p.embossThickness,p.embossThickness); c.strokeStyle="rgba(255,255,255,.1)"; c.stroke(path);
      c.restore();
    });
  }
  moveTo(x,y){ this.x=x; this.y=y; this.canvas.style.left=x+'px'; this.canvas.style.top=y+'px'; }
  moveToInitialPlace(){ const p=this.puzzle; this.moveTo(p.offsx+(this.pckxmin-.5)*p.scalex, p.offsy+(this.pckymin-.5)*p.scaley); }
}

class Puzzle{
  constructor(container){
    this.container=container; this.autoStart=true;
    ["mousedown","mousemove"].forEach(t=>container.addEventListener(t,e=>{e.preventDefault(); pushEvt(t=="mousedown"?"touch":"move", this.rel(e));}));
    container.addEventListener("mouseup",()=>pushEvt("leave"));
    container.addEventListener("touchstart",e=>{e.preventDefault(); if(e.touches.length!=1)return; pushEvt("touch", this.rel(e.touches[0]));},{passive:false});
    ["touchend","touchleave","touchcancel"].forEach(t=>container.addEventListener(t,()=>pushEvt("leave")));
    container.addEventListener("touchmove",e=>{e.preventDefault(); if(e.touches.length!=1)return; replaceMove(this.rel(e.touches[0]));},{passive:false});
    this.gameCanvas=document.createElement("canvas"); this.gameCanvas.style.zIndex=500; this.gameCanvas.className="gameCanvas"; container.appendChild(this.gameCanvas);
    this.srcImage=new Image(); this.srcImage.addEventListener("load",()=>{pushEvt("srcLoaded"); this.imageLoaded=true;}); this.imageLoaded=false;
  }
  getContainerSize(){ const s=getComputedStyle(this.container); this.contWidth=parseFloat(s.width); this.contHeight=parseFloat(s.height); }
  create(){
    this.container.querySelectorAll("canvas:not(.gameCanvas)").forEach(n=>n.remove());
    this.getContainerSize();
    this.nbPieces=NB_PIECES;
    this.computenxAndny();
    this.defineShapes({coeffDecentr:.12, twistf:twistClassic});
    this.polyPieces=[]; this.pieces.forEach(r=>r.forEach(pc=>this.polyPieces.push(new PolyPiece(pc,this))));
    arrayShuffle(this.polyPieces); this.evaluateZIndex();
  }
  computenxAndny(){
    let w=this.srcImage.naturalWidth, h=this.srcImage.naturalHeight, n=this.nbPieces, best=1e9;
    let nh= Math.round(Math.sqrt(n*w/h)), nv=Math.round(n/nh);
    for(let ky=0;ky<5;ky++){ let ncv=nv+ky-2;
      for(let kx=0;kx<5;kx++){ let nch=nh+kx-2; let err=nch*h/ncv/w; err=(err+1/err)-2; err+=A(1-nch*ncv/n);
        if(err<best){best=err; this.nx=nch; this.ny=ncv;}
      }
    }
  }
  defineShapes({coeffDecentr,twistf}){
    const nx=this.nx, ny=this.ny, corners=[];
    this.pieces=[];
    for(let ky=0;ky<=ny;ky++){ corners[ky]=[];
      for(let kx=0;kx<=nx;kx++){
        corners[ky][kx]=new Point(kx+alea(-coeffDecentr,coeffDecentr), ky+alea(-coeffDecentr,coeffDecentr));
        if(kx==0)corners[ky][kx].x=0; if(kx==nx)corners[ky][kx].x=nx; if(ky==0)corners[ky][kx].y=0; if(ky==ny)corners[ky][kx].y=ny;
      }
    }
    for(let ky=0;ky<ny;ky++){ this.pieces[ky]=[];
      for(let kx=0;kx<nx;kx++){
        const np=this.pieces[ky][kx]=new Piece(kx,ky);
        if(ky==0){ np.ts.points=[corners[ky][kx],corners[ky][kx+1]]; np.ts.type="d"; } else np.ts=this.pieces[ky-1][kx].bs.reversed();
        np.rs.points=[corners[ky][kx+1],corners[ky+1][kx+1]]; np.rs.type="d";
        if(kx<nx-1){ if(intAlea(2)) twistf(np.rs,corners[ky][kx],corners[ky+1][kx]); else twistf(np.rs,corners[ky][kx+2],corners[ky+1][kx+2]); }
        if(kx==0){ np.ls.points=[corners[ky+1][kx],corners[ky][kx]]; np.ls.type="d"; } else np.ls=this.pieces[ky][kx-1].rs.reversed();
        np.bs.points=[corners[ky+1][kx+1],corners[ky+1][kx]]; np.bs.type="d";
        if(ky<ny-1){ if(intAlea(2)) twistf(np.bs,corners[ky][kx+1],corners[ky][kx]); else twistf(np.bs,corners[ky+2][kx+1],corners[ky+2][kx]); }
      }
    }
  }
  scale(){
    const maxW = .95 * this.contWidth, maxH = .95 * this.contHeight;
    const shrinkFactor = 0.9;
    this.gameHeight = maxH * shrinkFactor;
    this.gameWidth  = this.gameHeight * this.srcImage.naturalWidth / this.srcImage.naturalHeight;

    if (this.gameWidth > maxW * shrinkFactor) {
      this.gameWidth  = maxW * shrinkFactor;
      this.gameHeight = this.gameWidth * this.srcImage.naturalHeight / this.srcImage.naturalWidth;
    }

    this.gameCanvas.width  = this.gameWidth;
    this.gameCanvas.height = this.gameHeight;
  this.gameCtx = this.gameCanvas.getContext("2d");
this.gameCtx.drawImage(this.srcImage, 0, 0, this.gameWidth, this.gameHeight);

// ce canvas ne sert que de source : on le cache immédiatement
this.gameCanvas.style.display = "none";      // <<<
this.gameCanvas.style.pointerEvents = "none"; // sécurité
this.gameCanvas.style.zIndex = "0";           // au cas où


    this.scalex = this.gameWidth / this.nx;
    this.scaley = this.gameHeight / this.ny;

    this.pieces.forEach(row => row.forEach(pc => pc.scale(this)));
    this.offsx = (this.contWidth  - this.gameWidth)  / 2;
    this.offsy = (this.contHeight - this.gameHeight) / 2;
    this.dConnect = X(10, M(this.scalex, this.scaley) / 10);
    this.embossThickness = M(2 + this.scalex / 200 * (5 - 2), 5);
  }

  rel(ev){ const r=this.container.getBoundingClientRect(); return {x:ev.clientX-r.x, y:ev.clientY-r.y}; }
  evaluateZIndex(){ for(let k=this.polyPieces.length-1;k>0;--k) if(this.polyPieces[k].pieces.length > this.polyPieces[k-1].pieces.length) [this.polyPieces[k],this.polyPieces[k-1]]=[this.polyPieces[k-1],this.polyPieces[k]];
    this.polyPieces.forEach((pp,k)=>pp.canvas.style.zIndex=k+10); this.zIndexSup=this.polyPieces.length+10; }
  spreadInRectangle(r){ this.polyPieces.forEach(pp=>pp.moveTo(alea(r.x0,r.x1),alea(r.y0,r.y1))); }
}

/* --- Dispersion forcée vers le BAS --- */
function spreadToBottom(puzzle){
  const minx = -puzzle.scalex / 2;
  const maxx = puzzle.contWidth - 1.5 * puzzle.scalex;
  const rectB = {
    x0: minx,
    x1: maxx,
    y0: puzzle.gameHeight - puzzle.scaley / 2,
    y1: puzzle.contHeight - 1.5 * puzzle.scaley
  };
  puzzle.spreadInRectangle(rectB);
  puzzle.evaluateZIndex();
}

/* ==== File d'événements ==== */
const events=[];
const pushEvt=(e,p)=>events.push({event:e,position:p});
const replaceMove=p=>{ if(events.length && events[events.length-1].event=="move") events.pop(); events.push({event:"move",position:p}); };

/* ==== Boucle de jeu ==== */
function start(container){
  injectStylesOnce();
  const {timer, btn, lock, msg} = ensureUI(container); // <<< récupère msg

  const puzzle=new Puzzle(container);
  let state=0, moving=null;
  let countdownStarted = false;
  let tEndGlobal = null; // <<< mémorise la fin du compte à rebours

  // UI initiale
  timer.style.display = "none";
  btn.style.display   = "none";
  lock.style.display  = "none";

  function startCountdown(){
    if (countdownStarted) return;
    countdownStarted = true;
    timer.style.display = "block";
    const tStart = performance.now();
    const tEnd   = tStart + RESTART_DELAY_MS;
    tEndGlobal   = tEnd; // <<< AJOUT
    timer.textContent = formatMMSS(RESTART_DELAY_MS);

    scheduleInterval(() => {
      const remaining = Math.max(0, tEnd - performance.now());
      timer.textContent = formatMMSS(remaining);
      timer.classList.toggle("danger", remaining <= 10000);
    }, 1000);

    schedule(() => {
      // Fin du temps : bloquer le jeu + bouton visible
      timer.style.display = "none";
      lock.style.display  = "block";   // bloque toute interaction
      btn.style.display   = "block";   // bouton au centre

      // <<< AJOUT : message d’échec pendant 3s
      showMessage(msg, "Failed !", 3000);

      // nettoyer un drag en cours
      if (moving && moving.pp && moving.pp.canvas) {
        moving.pp.canvas.classList.remove("moving","dragging");
        moving.pp.canvas.style.transition = "";
      }
      moving = null;
      events.length = 0;
      state = 30;
    }, RESTART_DELAY_MS);
  }

  function animate(){
    _rafId = requestAnimationFrame(animate);

    let ev = events.length ? events.shift() : null;
    if(ev && ev.event=="srcLoaded") state=0;

    if(ev && ev.event=="resize" && state>=25){
      puzzle.getContainerSize(); puzzle.scale();
      puzzle.polyPieces.forEach(pp=>{ pp.moveTo(pp.x, pp.y); pp.drawImage(); });
      return;
    }

    switch (state) {
      case 0:
        if (!puzzle.imageLoaded) return;
        state = 10;
        break;

      case 10:
        // Image reconstituée
        puzzle.create(); puzzle.scale();
        puzzle.polyPieces.forEach(pp => {
          pp.drawImage();
          pp.moveTo(
            puzzle.offsx + (pp.pckxmin - .5) * puzzle.scalex,
            puzzle.offsy + (pp.pckymin - .5) * puzzle.scaley
          );
        });
        // après SHOW_DURATION → chute
        schedule(() => events.push({ event: "startSpread" }), SHOW_DURATION);
        state = 15;
        break;

      case 15:
        if (!ev || ev.event !== "startSpread") return;
        // activer la transition CSS, puis chute vers le BAS
        puzzle.polyPieces.forEach(pp => pp.canvas.classList.add("moving"));
        spreadToBottom(puzzle);
        schedule(() => events.push({ event: "spreadDone" }), 1000);
        state = 25;
        break;

      case 25:
        if (!ev || ev.event !== "spreadDone") return;
        // fin de chute : enlever transition et passer jouable
        puzzle.polyPieces.forEach(pp => pp.canvas.classList.remove("moving"));
        state = 30;
        // >>> démarrer le timer ICI (à la toute fin de la chute)
        startCountdown();
        timer.style.display = "block";
        timer.classList.remove("danger");
        {
          const tStart = performance.now();
          const tEnd   = tStart + RESTART_DELAY_MS;
          timer.textContent = formatMMSS(RESTART_DELAY_MS);
        }
        break;

      case 30: // interaction
        if (!ev) return;
        if (ev.event !== "touch") return;
        // si lock affiché, on ignore (bloqué)
        if (lock.style.display === "block") return;

        moving = { x0: ev.position.x, y0: ev.position.y };
        for (let k = puzzle.polyPieces.length - 1; k >= 0; --k) {
          const pp = puzzle.polyPieces[k];
          if (pp.ctx.isPointInPath(pp.path, ev.position.x - pp.x, ev.position.y - pp.y)) {
            moving.pp = pp; moving.px = pp.x; moving.py = pp.y;
            // Monter la pièce
            puzzle.polyPieces.splice(k, 1); puzzle.polyPieces.push(pp);
            pp.canvas.style.zIndex = puzzle.zIndexSup;
            // pas de transition pendant le drag
            pp.canvas.classList.remove("moving");
            pp.canvas.classList.add("dragging");
            pp.canvas.style.transition = "none";
            state = 35; return;
          }
        }
        break;

      case 35: // déplacement + fusion
        if (!ev) return;
        if (ev.event === "move") {
          if (lock.style.display === "block") return; // blocage si fin de temps
          moving.pp.moveTo(
            ev.position.x - moving.x0 + moving.px,
            ev.position.y - moving.y0 + moving.py
          );
        } else if (ev.event === "leave") {
          // fin de drag : nettoyage
          moving.pp.canvas.classList.remove("dragging");
          moving.pp.canvas.style.transition = "";
          // fusion si proche
          let merged=false;
          do{
            merged=false;
            for (let k = puzzle.polyPieces.length - 1; k >= 0; --k) {
              const pp = puzzle.polyPieces[k]; if (pp === moving.pp) continue;
              if (moving.pp.ifNear(pp)) {
                if (pp.pieces.length > moving.pp.pieces.length) { pp.merge(moving.pp); moving.pp = pp; }
                else moving.pp.merge(pp);
                merged = true; break;
              }
            }
          } while (merged);
          puzzle.evaluateZIndex();

          // <<< AJOUT : détection de complétion du puzzle
          const totalPieces = puzzle.nx * puzzle.ny;
          const completed =
            puzzle.polyPieces.length === 1 &&
            moving && moving.pp && moving.pp.pieces.length === totalPieces;

          // Terminé ET dans les temps => message succès, pas de bouton
      // Terminé ET dans les temps => message succès, pas de bouton
if (completed && (tEndGlobal === null || performance.now() < tEndGlobal)){
  clearAllTimers();           // empêche tout timeout/interval restant
  timer.style.display = "none";
  btn.style.display   = "none"; // ne pas montrer le bouton

  // <<< AJOUT : recentrer le puzzle comme au début
  moving.pp.canvas.classList.add("moving"); // utilise la même transition CSS douce que la “chute”
  moving.pp.moveToInitialPlace();           // repositionne au centre (offsx/offsy + -.5*scale)
  schedule(() => moving.pp.canvas.classList.remove("moving"), 600);

  lock.style.display  = "block"; // gèle l’UI (retire si tu veux laisser interactif)
  showMessage(msg, "Well done !", 3000);
  state = 40; // état inerte/victoire
  return;
}


          state = 30;
        }
        break;
    }
  }

  // charger l'image et démarrer
  puzzle.srcImage.src = getImageURL();
  _rafId = requestAnimationFrame(animate);

  // (REMPLACÉ) — le listener resize est désormais géré par le cycle de vie global
}

/* ==== Restart = reload page (idempotent) ==== */
if (!window.__puzzleClickBound) {
  document.addEventListener("click", function(e) {
    if (e.target && e.target.id === RESTART_BTN_ID) {
      clearAllTimers();
      location.reload();
    }
  });
  window.__puzzleClickBound = true;
}

/* ==== Bootstrap & helpers ==== */
function isShown(el){
  if(!el) return false;
  const r = el.getBoundingClientRect();
  const s = getComputedStyle(el);
  return s.display !== "none" && s.visibility !== "hidden" && r.width > 0 && r.height > 0;
}

// --- LIFECYCLE TURBO / BFCache ---------------------------------
let __puzzleMounted = false;
let __onResize = null;

function teardownPuzzle(){
  // stop boucles et timers
  clearAllTimers();

  // stop rAF sécu
  if (_rafId != null) { cancelAnimationFrame(_rafId); _rafId = null; }

  // nettoyer events/window
  if (__onResize) { window.removeEventListener("resize", __onResize); __onResize = null; }

  // retirer canvases & overlays générés
  const c = document.getElementById(CONTAINER_ID);
  if (c) {
    c.querySelectorAll("canvas.polypiece, canvas.gameCanvas, "+
                       `#${TIMER_ID}, #${RESTART_BTN_ID}, #${LOCK_ID}, #${MSG_ID}`).forEach(n => n.remove()); // <<< inclut MSG_ID

    // important : mark as unmounted
    delete c.dataset.puzzleMounted;
  }

  // purge file d’événements
  events.length = 0;
  __puzzleMounted = false;
}

/* version idempotente du montage */
function mountPuzzle(){
  const container = document.getElementById(CONTAINER_ID);
  if(!container) return;

  // évite le double-montage après turbo:load/pageshow
  if (container.dataset.puzzleMounted === "1") return;

  // attendre que le conteneur soit visible
  if(!isShown(container)){ _rafId = requestAnimationFrame(mountPuzzle); return; }

  // marquer monté
  container.dataset.puzzleMounted = "1";
  __puzzleMounted = true;

  // wrapper le resize pour pouvoir l’enlever au teardown
  __onResize = () => {
    if(events.length && events[events.length-1].event=="resize") return;
    pushEvt("resize");
  };
  window.addEventListener("resize", __onResize, { passive: true });

  // démarrer
  start(container);
}

// hooks Turbo / BFCache
if (document.readyState !== "loading") mountPuzzle();
document.addEventListener("DOMContentLoaded", mountPuzzle);
document.addEventListener("turbo:load", mountPuzzle);
document.addEventListener("turbo:before-cache", teardownPuzzle);
document.addEventListener("turbo:before-render", teardownPuzzle);

// BFCache (retour arrière du navigateur)
window.addEventListener("pageshow", (e) => {
  if (e.persisted) {
    teardownPuzzle();
    mountPuzzle();
  }
});
window.addEventListener("pagehide", teardownPuzzle);

})();

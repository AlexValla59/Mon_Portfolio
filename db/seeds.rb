# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "#####################"
puts ' Cleaning database...'
puts "#####################"

Creation.destroy_all

p "--------------all creations deleted--------------"


Creation.create(
    nom:"L'île aux cycles", 
    creation_type: 'logo, site web', 
    format: "paysage4",
    image_paths:"site_wordpress-responsive-lileauxcycles.webp, lileauxcycles2.jpg, logo_lile_aux_cycles.webp, logo_lile_aux_cycles_white.webp",
    description: "J’ai créé l’identité visuelle complète d’un réparateur de vélos à Lille : logo sur-mesure, carte de visite design et site web dynamique. Développé en HTML, CSS et JavaScript, hébergé sur Hostinger, le site est responsive, optimisé pour le SEO et pensé pour offrir une navigation fluide sur tous les appareils. Résultat : un ensemble cohérent, moderne et performant qui reflète parfaitement l’image de l’entreprise.", 
    photos: "lileauxcycles_blanc.jpg", 
    date: "Janvier 2025", 
    logiciel:'Adobe AI, Hostinger', 
    poste_occupe: "Identité visuelle, Conception site web, html, css, javascript, adobe illustrator, seo .",
    entreprise: 'Alex Pensif')


Creation.create(
    nom:' Taktel', 
    creation_type: 'Affiches', 
    format: "portrait",
    image_paths:"mobile_parachute.jpg, mobile_lune.jpg, mobile_eau.jpg, logo_taktel.jpg",
    description: "Dans le cadre d’un projet créatif personnel, j’ai imaginé l’identité visuelle et une campagne publicitaire pour Taktel, marque fictive de télécommunications. Trois affiches illustrent un réseau ultra-performant dans des conditions extrêmes : en plein vol, sur la Lune et sous l’eau. Accroches percutantes, visuels minimalistes et contrastés traduisent innovation et fiabilité, tout en conservant une identité graphique cohérente.", 
    photos: "taktel.jpg", 
    date: "Décembre 2024", 
    logiciel:'Adobe ID, AI, PS', 
    poste_occupe: "Conception graphique, Photoshop, Indesign, Illustrator, Retouche photo, Création logo .",
    entreprise: 'Brief fictif')








Creation.create(
    nom:' Éclipse', 
    creation_type: 'Affiches', 
    format: "portrait3",
    image_paths:"homme_parfum.jpg, femme_parfum.jpg, logo_eclipse_noir.jpg",
    description: "Projet créatif personnel : conception de l’identité visuelle et d’une campagne publicitaire pour le parfum fictif Éclipse. Inspiré du contraste ombre/lumière, le concept exprime mystère et élégance autour de l’accroche « Séduisez l’ombre… Attirez la lumière ». Visuels minimalistes et sophistiqués mettent en valeur le produit et son aura magnétique.", 
    photos: "logo_eclipse.jpg", 
    date: "Novembre 2024", 
    logiciel:'Adobe ID, AI, PS', 
    poste_occupe: "Conception graphique, Photoshop, Indesign, Illustrator, Retouche photo, Création logo .",
    entreprise: 'Brief fictif')


Creation.create(
    nom:'Flying Whales', 
    creation_type: 'Affiches', 
    format: "paysage4",
    image_paths:"tortue.jpg, phoque.jpg, requin.jpg, logo_flying_whales.jpg",
    description: "Projet personnel : création de trois affiches fictives pour Flying Whales, campagne de sensibilisation à la protection des océans. Chaque visuel, partagé entre un océan sain et un océan pollué, met en scène une tortue, un phoque et un requin autour de l’accroche « Sauvés ou perdus : quel avenir pour nos océans ? ». Objectif : interpeller, sensibiliser et inciter à agir via un QR code menant à des actions concrètes.", 
    photos: "flying Whales.jpg", 
    date: "Novembre 2024", 
    logiciel:'Adobe ID, AI, PS', 
    poste_occupe: "Conception graphique, Photoshop, Indesign, Illustrator, Retouche photo, Création de logo.",
    entreprise: 'Brief fictif')


Creation.create(
    nom:'Funenord', 
    creation_type: 'Plaques Funéraires', 
    format: "paysage",
    image_paths:"catalogues_souv.jpg, catalogues_souv_page1.jpg, catalogues_souv_page2.jpg, photo_souv.jpg, fun1.jpg, fun2.jpg, fun3.jpg, fun4.jpg, fun5.jpg",
    description: "Chez Funérarts, j’ai occupé le poste de pilote infographie et atelier, encadrant l’équipe pour atteindre les objectifs de production. J’ai conçu des plaques funéraires (infographie, pose de vinyle, découpe laser, montage, emballage, expédition) et réalisé des impressions chromo sur porcelaine avec un haut niveau de qualité. J’ai participé à la création de deux catalogues pour les marques Hochart et Dussaux (retouche photo, réglages colorimétriques) et élaboré un kit de création commercial destiné aux équipes de vente.", 
    photos: "fun.jpg", 
    date: "Mai à Juillet 2024", 
    logiciel:'Adobe ID, AI, PS', 
    poste_occupe: "Conception graphique, Photoshop, Indesign, Illustrator, Caldera, Impression Latex, Plans vectoriels, Impression Chromo sur porcelaine,  Retouche photo, Contraintes techniques print et web .",
    entreprise: 'Funenord Diffusion')

    Creation.create(
        nom:'Netcom', 
        creation_type: 'Motion Design', 
        format: "portrait", 
        image_paths:'netcom1.jpg, netcom2.jpg, netcom3.jpg, netcom4.jpg' , 
        description: "Dans le cadre de ma candidature chez Netcom Group, j'ai été amené à réaliser un exercice créatif consistant à concevoir une vidéo en motion design d'une durée d'une minute. L'objectif était de mettre en avant leur offre de fibre optique, tout en respectant une création libre sur le plan visuel et narratif.
    
    Ce projet m'a permis de démontrer ma capacité à synthétiser une offre technique de manière claire et engageante, tout en créant un contenu visuel dynamique qui reflète l'innovation et la modernité de Netcom Group.", 
        photos: "netcom.jpg", 
        date: "Février 2024", 
        logiciel:'Adobe AE', 
        poste_occupe: "After Effects, Motion Design, Animation graphique, Conception visuelle, Storyboarding, Création de contenu dynamique, Montage vidéo, Édition sonore, Communication visuelle", 
        entreprise: 'Exercice candidature')

Creation.create(
    nom:'City Break', 
    creation_type: 'Application Web', 
    format: "web",
    image_paths:'city1.png, city2.png, city3.png, city4.png' , 
    description: "City Break est une application web qui propose une expérience d'escape game en plein air à travers les rues de Lille. Cette application offre aux utilisateurs l'opportunité de découvrir la ville d'une manière inédite en résolvant une série d'énigmes pendant une heure. Conçue pour un large public, City Break mêle le jeu et la découverte de Lille, en invitant les participants à explorer la ville et à déverrouiller des indices pour résoudre des mystères. Cette expérience immersive permet de redécouvrir des quartiers familiers tout en apprenant de nouvelles facettes de l'histoire et de la culture de la ville.", 
    photos: "cb2.jpg", 
    date: "Juin 2023", 
    logiciel:'Ruby on Rails', 
    poste_occupe: "Ruby, HTML, SCSS, JavaScript, Figma, Développement web, Conception d'interface utilisateur (UI), Expérience utilisateur (UX), Intégration de bases de données, Sécurité web", 
    entreprise: 'Le Wagon')




Creation.create(
    nom:'Lions Club', 
    creation_type: "Affiches web et print", 
    format: "portrait3", 
    image_paths:'affiche_lionsclub.jpg, affiche_lionsclub22.jpg, Affiche_robert_debre_real.webp' ,
    description: "En collaboration avec le Lions Club, j’ai conçu l’affiche du Trophée Caritatif de l’Hôpital Debré, diffusée sur les panneaux JCDecaux à Neuilly-sur-Seine. L’affiche a été déclinée en format A5 avec formulaire d’inscription et en version web pour les réseaux sociaux, afin de maximiser la visibilité de l’événement et soutenir cette cause humanitaire.",
    photos: 'lions2.jpg', 
    date:'Mars 2023', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: "Conception graphique, Photoshop, Indesign, Retouche photo, Contraintes techniques print et web , Communication visuelle, Création d'affiches, Conception pour panneaux publicitaires, Design web, Réseaux sociaux.", 
    entreprise: 'Alex Pensif')


Creation.create(
    nom:'Gorillas', 
    creation_type: "Newsletters et t-shirts",
    format: "paysage",
    image_paths: "tshirt_gorillas_large.webp, gorillas3.jpg, gorillas4.jpg, gorillas5.jpg, gorillas6.jpg, gorillas7.jpg, gorillas8.jpg, gorillas9.jpg, gorillas10.jpg",
    description: "Au cours de mon expérience chez Gorillas, j'ai eu l'opportunité de mettre en lumière ma créativité. J'ai créé différentes infographies pour enrichir nos newsletters nationales, apportant ainsi une touche d'originalité à notre communication interne. De plus, j'ai eu le privilège de concevoir des t-shirts spécialement conçus pour notre opération d'acquisition client, offrant ainsi une approche unique pour attirer de nouveaux prospects de notre marque.", 
    photos: 'gorillas2.jpg', 
    date:'2021 à 2023', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: "Conception graphique, Photoshop, Indesign, Illustrator, Mailchimp, Retouche photo, Vectorisation, Communication visuelle, Insertion graphique, Newsletter, Design web.", 
    entreprise: 'Gorillas')

Creation.create(
    nom:'Boulanger', 
    creation_type: "Affiche Print & Web",
    format: "portrait",
    image_paths: "boulanger1.jpg, boulanger2.jpg, Boulanger3.jpg, Boulanger5.jpg",
    description: "Dans le cadre de ma candidature chez Boulanger, j’ai conçu une affiche pour l’offre Eco-reprise TV lors de l’Euro 2021, ainsi qu’un logo dédié et ses déclinaisons pour le web et les réseaux sociaux. J’ai également retouché des photos pour harmoniser les visuels avec l’identité de marque, tout en valorisant ses engagements environnementaux.", 
    photos: 'boulanger.jpg', 
    date:'2020', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: "Adobe Illustrator, Adobe Photoshop, Conception graphique, Création d'affiches, Branding, Communication visuelle, Retouche photo, Gestion de projet, Déclinaison multicanal", 
    entreprise: 'Exercice candidature')

Creation.create(
    nom:'Plug & Play', 
    creation_type: "Catalogues produits",
    format: "paysage4",
    image_paths:"catalogues_plugandplay_3.webp, catalogues_plugandplay_1.webp, catalogues_plugandplay_3.webp, catalogues_plugandplay_2.webp",
    description: "Freelance, j'ai conçu des catalogues produits dynamiques et modernes pour l'entreprise Plug & Play. Mon objectif était de créer des outils de marketing visuellement attrayants et informatifs. J'ai méticuleusement élaboré des mises en page, des visuels et des descriptions de produits pour mettre en valeur le catalogue. Mon travail a permis à l'entreprise de présenter ses produits de manière professionnelle, améliorant ainsi son image de marque et facilitant la compréhension des clients. Ces catalogues ont été des atouts précieux pour Plug & Play, renforçant sa présence sur le marché et facilitant la promotion de ses produits.", 
    photos: 'plug2.jpg', 
    date:'2015 à 2019', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: "Conception graphique, Photoshop, Indesign, Illustrator, Retouche photo, Contraintes techniques print, Communication visuelle, Montage Catalogues, PAO", 
    entreprise: 'Alex Pensif')

Creation.create(
    nom:'FotoBorne', 
    creation_type: "Supports Marketing",
    format: "paysage4",
    image_paths:"flyer_fotoborne_1.webp, flyer_fotoborne_2.webp, flyer_fotoborne_3.webp, bornes_site.jpg",
    description: "En qualité d'infographiste chez FotoBORNE, j'ai joué un rôle clé en concevant la plaquette commerciale pour les formats imprimés et web, créant des stickers originaux pour les bornes photos, et élaborant des designs personnalisés pour les photos imprimées. En parallèle, j'ai géré et développé le contenu des réseaux sociaux de l'entreprise. Mon rôle polyvalent a contribué à renforcer l'identité visuelle de la marque et à promouvoir ses produits de manière créative. Mon expérience a été une fusion réussie de créativité, de design et de communication, contribuant à l'essor de l'entreprise FotoBORNE.",
    photos: 'fotoborne2.jpg', 
    date:'2015 à 2020', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: "Conception graphique, Photoshop, Indesign, Illustrator, Mailchimp,  Retouche photo, Contraintes techniques print et web, Communication visuelle, Création d'affiches, Conception pour panneaux publicitaires, Design web, Contenu pour réseaux sociaux.", 
    entreprise: 'Fotoborne Animation')

Creation.create(
    nom:'Créations', 
    creation_type: "Visuels",
    format: "paysage_crea",
    image_paths: "creation1.png, creation2.png, creation3.png, creation4.png, creation5.png, creation6.png, creation7.png, creation8.png, creation9.png, creation10.png, creation11.png, creation12.png, creation13.png, creation14.png",
    description: "Au fil de mon parcours artistique, j'ai façonné divers supports visuels tels que des faire-part de mariage, des maquettes de disques, des présentations de mémoire et des CVs originaux. Chacune de ces créations a impliqué un processus méticuleux, combinant la retouche photo pour capturer l'essence des moments, la création d'illustrations pour ajouter une touche personnelle, et le montage habile sur InDesign pour donner vie à l'ensemble. Ces réalisations, bien que réalisées avec soin, ont été entreprises sans qu'une rémunération financière soit la motivation première. Ma démarche artistique repose davantage sur le désir de concrétiser les visions et les idées des personnes qui ont sollicité mon expertise.",
    photos: 'alexcrea2.jpg', 
    date:'2015 à 2023', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: "Conception graphique, Photoshop, Indesign, Illustrator, Retouche photo, Contraintes techniques print, Communication visuelle, Création d'affiches, Vectorisation.", 
    entreprise: 'Alex Pensif')



Creation.create(
    nom:'Mes dessins', 
    creation_type: "Dessins PAO", 
    format:"paysage", 
    image_paths:"Death_note.jpg ,dessin7.png, dessin5.png, dessin4.png, dessin8.png, dessin1.png, dessin6.png, dessin2.png, dessin3.png",
    description: "Après avoir suivi des formations, j'ai décidé de consacrer du temps à m'entraîner sur les logiciels Illustrator, notamment pour créer des illustrations originales, et InDesign, pour la mise en page. Mon objectif était de reproduire des scènes de films, des affiches, des animations, et même de créer des affiches personnalisées. Il est important de souligner que ces reproductions d'affiches ne sont pas destinées à la vente, mais servent exclusivement à mon perfectionnement personnel.", 
    photos: 'dessins.jpg', 
    date:'2010 à 2023', 
    logiciel:'Adobe IA, ID', 
    poste_occupe: "Conception graphique, Illustrator, Contraintes techniques print, Création d'affiches, Vectorisation",  
    entreprise: 'Alex Pensif')

# Creation.create(
#     nom:'Autres', 
#     creation_type: "sdfz"   ,
#     description: 'efzfzefzefzefzfeezfezf', 
#     photos: '', 
#     date:'', 
#     logiciel:'',
#     poste_occupe: '', 
#     entreprise: '')





p "-------------- #{Creation.count} creations created--------------"
puts 'Finished!'
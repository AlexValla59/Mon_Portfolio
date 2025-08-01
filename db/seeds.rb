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
    description: "J’ai conçu le logo et réalisé le site web d’un réparateur de vélos basé à Lille. Pour ce projet, j’ai utilisé Hostinger comme hébergement et intégré du code HTML, CSS et JavaScript afin de créer un site dynamique et responsive, parfaitement adapté aux besoins de mon client.

L’objectif était d’offrir une interface fluide et intuitive, accessible sur tous les appareils. J’ai également optimisé le site pour le SEO, en travaillant sur la structure des balises, la vitesse de chargement et le contenu, afin d’améliorer sa visibilité sur les moteurs de recherche.

Grâce à cette approche, le site combine design attractif, navigation optimisée et performance pour garantir une expérience utilisateur optimale.", 
    photos: "lileauxcycles_blanc.jpg", 
    date: "Janvier 2025", 
    logiciel:'Adobe AI, Hostinger', 
    poste_occupe: "Conception site web, html, css, javascript, adobe illustrator, seo .",
    entreprise: 'Alex Pensif')


Creation.create(
    nom:' Taktel', 
    creation_type: 'Affiches', 
    format: "portrait",
    image_paths:"mobile_parachute.jpg, mobile_lune.jpg, mobile_eau.jpg, logo_taktel.jpg",
    description: "Dans le cadre d’un exercice de création, entrepris de ma propre initiative, j'ai travaillé sur la conception d'une identité visuelle et d'une campagne publicitaire pour une marque fictive de télécommunications appelée Taktel. L'objectif de ce projet était de mettre en lumière l'idée d'un réseau ultra-performant, capable de fonctionner dans les conditions les plus extrêmes.

Pour illustrer ce concept, j'ai créé trois affiches publicitaires mettant en scène des environnements spectaculaires :

    Une première affiche, avec l'accroche 'Le réseau qui capte même dans les aiiirs !', exploite l'image d'un saut en parachute pour représenter une connexion stable, même en plein vol.
    Une seconde affiche, avec l'accroche 'Le réseau qui capte même sur la Lune !', symbolise la fiabilité du réseau, même au-delà des limites terrestres.
    Une troisième affiche, avec l'accroche 'Le réseau qui capte même sous l’eau !', met en scène un plongeur utilisant son smartphone en immersion, illustrant la capacité du réseau à fonctionner dans les profondeurs marines.

Chaque accroche a été adaptée au contexte visuel pour renforcer l'impact et le storytelling, tout en conservant une cohérence globale dans l'identité graphique. Les visuels minimalistes et percutants s’appuient sur des contrastes forts et des mises en scène immersives pour exprimer l’innovation et la fiabilité technologique de la marque.

Ce projet m’a permis d’explorer différentes techniques de design graphique et de communication publicitaire, tout en développant des messages adaptés à chaque situation.", 
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
    description: "Dans le cadre d’un exercice de création, entrepris de ma propre initiative, j'ai travaillé sur un brief fictif visant à concevoir une identité visuelle et une campagne publicitaire pour un parfum appelé 'Éclipse'. L'objectif était de développer un logo ainsi que deux affiches publicitaires, destinées à incarner l'esprit du parfum.

Le concept créatif repose sur l'idée du contraste entre ombre et lumière, symbolisant à la fois le mystère et l'élégance. L'accroche choisi, 'Seduisez l'ombre... Attirez la lumière', met en avant le caractère captivant et magnétique de la fragrance.

Les visuels présentent un design minimaliste et sophistiqué, mettant en avant le produit de manière évocatrice. Ce projet m'a permis d'explorer des techniques de design graphique et de branding", 
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
    description: "Dans le cadre d’un exercice de création, entrepris de ma propre initiative,, j’ai conçu une série de trois affiches fictives pour une campagne de sensibilisation visant à protéger les océans, commanditée par une organisation imaginaire appelée Flying Whales. L’objectif principal de cette campagne est d’alerter le public sur les dangers de la pollution marine pour la faune océanique, tout en incitant à agir pour un avenir plus durable.

Chaque affiche présente un animal emblématique (tortue, phoque, requin) dans un visuel divisé entre deux réalités : un océan sain et un océan pollué. Ce contraste puissant est renforcé par l'accroche : 'Sauvés ou perdus : quel avenir pour nos océans ?'.

Ces visuels ont été conçus pour interpeller, sensibiliser et inciter à agir grâce à un QR code dirigeant vers des actions concrètes. Ce projet m'a permis de travailler sur des visuels engagés tout en explorant des techniques graphiques pour des causes environnementales.", 
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
    description: "Lors de mon expérience chez Funérarts, j'ai occupé le poste de pilote infographie et atelier. Mes principales responsabilités étaient les suivantes : J'ai dirigé l'équipe pour atteindre les objectifs fixés, en veillant à la coordination et à l'efficacité de chaque membre. J'ai conçu des plaques funéraires, en utilisant des techniques variées telles que l'infographie, la pose de vinyle, la découpe laser, le montage, l'emballage et l'envoi des colis. J'ai réalisé des impressions chromo sur de la porcelaine, garantissant une qualité optimale des produits finis. J'ai collaboré à la création de deux catalogues pour les marques Hochart et Dussaux. Mes tâches incluaient la retouche photo, ainsi que les réglages de couleurs et de luminosité pour assurer une présentation impeccable des produits.", 
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
    description: "J'ai collaboré avec le Lions Club pour créer une affiche destinée au Trophée Caritatif de l'Hôpital de Debré. Cette affiche a été déployée dans les rues de Neuilly-sur-Seine sur les panneaux publicitaires de JCDecaux. En outre, nous avons adapté cette affiche en format A5 recto verso pour y inclure un formulaire d'inscription. De plus, nous avons créé une version au format web pour une diffusion étendue sur les réseaux sociaux, permettant ainsi d'atteindre un public encore plus large pour cette noble cause. Cette expérience a été une opportunité enrichissante de mettre en avant nos compétences en conception graphique et en communication pour soutenir une cause humanitaire importante.",
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
    image_paths: "boulanger1.jpg, boulanger2.jpg, Boulanger3.jpg, Boulanger4.jpg",
    description: "Lors de mon processus de candidature chez Boulanger, j'ai eu l'opportunité de réaliser plusieurs exercices créatifs dans le cadre du poste de graphiste. L'un des premiers défis consistait à concevoir une affiche pour promouvoir l'offre « Eco-reprise TV » pendant l'Euro 2021. Cette offre permettait aux clients d'échanger leur ancienne télévision contre un bon d'achat, tout en assurant le recyclage ou la revente en seconde main des télévisions de moins de 5 ans. En plus de cette affiche, j'ai conçu un logo spécifique pour l’offre « Eco-reprise », et j'ai décliné cette campagne sous plusieurs formats, notamment pour les réseaux sociaux et le site web de Boulanger. Enfin, j'ai également retouché des photos pour rendre les visuels plus attractifs et en adéquation avec l'image de la marque.
                Ces exercices m'ont permis de démontrer ma capacité à créer des visuels cohérents pour des supports variés, tout en respectant l'identité visuelle et les valeurs environnementales de Boulanger.", 
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
    description: "Freelance,, j'ai conçu des catalogues produits dynamiques et modernes pour l'entreprise Plug & Play. Mon objectif était de créer des outils de marketing visuellement attrayants et informatifs. J'ai méticuleusement élaboré des mises en page, des visuels et des descriptions de produits pour mettre en valeur le catalogue. Mon travail a permis à l'entreprise de présenter ses produits de manière professionnelle, améliorant ainsi son image de marque et facilitant la compréhension des clients. Ces catalogues ont été des atouts précieux pour Plug & Play, renforçant sa présence sur le marché et facilitant la promotion de ses produits.", 
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
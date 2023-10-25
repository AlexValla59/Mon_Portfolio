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
    nom:'City Break', 
    creation_type: 'Application Web', 
    format: "web",
    image_paths:'city1.png, city2.png, city3.png, city4.png' , 
    description: "City Break est une application web qui propose une expérience d'escape game en plein air à travers les rues de Lille. Cette application, développée avec Ruby on Rails, offre aux utilisateurs l'opportunité de découvrir la ville d'une manière inédite en résolvant une série d'énigmes pendant une heure. Conçue pour un large public, City Break mêle le jeu et la découverte de Lille, en invitant les participants à explorer la ville et à déverrouiller des indices pour résoudre des mystères. Cette expérience immersive permet de redécouvrir des quartiers familiers tout en apprenant de nouvelles facettes de l'histoire et de la culture de la ville.", 
    photos: "cb2.jpg", 
    date: "Juin 2023", 
    logiciel:'Ruby on Rails', 
    poste_occupe: "Création et développement d'un escape game extérieur", 
    entreprise: 'Le Wagon')

Creation.create(
    nom:'Lions Club', 
    creation_type: "Affiches web et print", 
    format: "portrait", 
    image_paths:'affiche_lionsclub.jpg, affiche_lionsclub22.jpg, lions_sucette.jpg, lions_sucette2.jpg' ,
    description: "J'ai collaboré avec le Lions Club pour créer une affiche de 2m² destinée au Trophée Caritatif de l'Hôpital de Debré. Cette affiche a été déployée dans les rues de Neuilly-sur-Seine sur les panneaux publicitaires de JCDecaux. En outre, nous avons adapté cette affiche en format A5 recto verso pour y inclure un formulaire d'inscription. De plus, nous avons créé une version au format web pour une diffusion étendue sur les réseaux sociaux, permettant ainsi d'atteindre un public encore plus large pour cette noble cause. Cette expérience a été une opportunité enrichissante de mettre en avant nos compétences en conception graphique et en communication pour soutenir une cause humanitaire importante.",
    photos: 'lions2.jpg', 
    date:'Mars 2023', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: 'Infographiste', 
    entreprise: 'Auto-entrepreneur')


Creation.create(
    nom:'Gorillas', 
    creation_type: "Newsletters et t-shirts",
    format: "paysage",
    image_paths: "gorillas1.jpg, gorillas3.jpg, gorillas4.jpg, gorillas5.jpg, gorillas6.jpg, gorillas7.jpg, gorillas8.jpg, gorillas9.jpg, gorillas10.jpg",
    description: "Au cours de mon expérience chez Gorillas, j'ai eu l'opportunité de mettre en lumière ma créativité. J'ai créé différentes infographies pour enrichir nos newsletters nationales, apportant ainsi une touche d'originalité à notre communication interne. De plus, j'ai eu le privilège de concevoir des t-shirts spécialement conçus pour notre opération d'acquisition client, offrant ainsi une approche unique pour attirer de nouveaux prospects de notre marque.", 
    photos: 'gorillas2.jpg', 
    date:'2021 à 2023', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: 'Warehouse Supervisor', 
    entreprise: 'Gorillas')

Creation.create(
    nom:'Plug & Play', 
    creation_type: "Catalogues produits",
    format: "portrait_foto",
    image_paths:"plug11.jpg, plug12.jpg, plug13.jpg, plug14.jpg, plug15.jpg",
    description: "En tant qu'auto-entrepreneur, j'ai conçu des catalogues produits dynamiques et modernes pour l'entreprise Plug & Play. Mon objectif était de créer des outils de marketing visuellement attrayants et informatifs. J'ai méticuleusement élaboré des mises en page, des visuels et des descriptions de produits pour mettre en valeur le catalogue. Mon travail a permis à l'entreprise de présenter ses produits de manière professionnelle, améliorant ainsi son image de marque et facilitant la compréhension des clients. Ces catalogues ont été des atouts précieux pour Plug & Play, renforçant sa présence sur le marché et facilitant la promotion de ses produits.", 
    photos: 'plug2.jpg', 
    date:'2015 à 2019', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: 'Infographiste', 
    entreprise: 'Auto-entrepreneur')

Creation.create(
    nom:'FotoBorne', 
    creation_type: "Supports Marketing",
    format: "portrait_foto",
    image_paths:"fotoborne_n.jpg, fotoborne_solo.jpg, fotoborne_wall.jpg, fotoborne4.jpg, bornes_site.jpg",
    description: "En tant qu'infographiste chez FotoBORNE, j'ai joué un rôle clé en concevant la plaquette commerciale pour les formats imprimés et web, créant des stickers originaux pour les bornes photos, et élaborant des designs personnalisés pour les photos imprimées. En parallèle, j'ai géré et développé le contenu des réseaux sociaux de l'entreprise. Mon rôle polyvalent a contribué à renforcer l'identité visuelle de la marque et à promouvoir ses produits de manière créative. Mon expérience a été une fusion réussie de créativité, de design et de communication, contribuant à l'essor de l'entreprise FotoBORNE.",
    photos: 'fotoborne2.jpg', 
    date:'2015 à 2020', 
    logiciel:'Adobe ID, AI et PS', 
    poste_occupe: 'Infographiste', 
    entreprise: 'Fotoborne Animation')

Creation.create(
    nom:'Créations', 
    creation_type: "thdger"   ,
    description: 'zefzefezfzefzfzefezfzefz', 
    photos: 'alexcrea2.jpg', 
    date:'', 
    logiciel:'', 
    poste_occupe: '', 
    entreprise: '')



Creation.create(
    nom:'Mes dessins', 
    creation_type: "Dessins PAO", 
    format:"paysage"  ,
    description: 'zefzefzefzefzefzefzefez', 
    photos: 'dessins.jpg', 
    date:'2010 à 2023', 
    logiciel:'Adobe IA, ID', 
    poste_occupe: 'Infographiste', 
    entreprise: 'Auto-entrepreneur')

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
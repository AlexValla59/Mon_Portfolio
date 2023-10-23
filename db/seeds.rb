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


Creation.create(nom:'City Break', creation_type: 'Application Web', format: "web",image_paths:'city1.png, city2.png, city3.png, city4.png' , description: "City Break est une application web qui propose une expérience d'escape game en plein air à travers les rues de Lille. Cette application, développée avec Ruby on Rails, offre aux utilisateurs l'opportunité de découvrir la ville d'une manière inédite en résolvant une série d'énigmes pendant une heure. Conçue pour un large public, City Break mêle le jeu et la découverte de Lille, en invitant les participants à explorer la ville et à déverrouiller des indices pour résoudre des mystères. Cette expérience immersive permet de redécouvrir des quartiers familiers tout en apprenant de nouvelles facettes de l'histoire et de la culture de la ville.", photos: "cb2.jpg", date: "Juin 2023", logiciel:'Ruby on Rails', poste_occupe: "Création et développement d'un escape game extérieur", entreprise: 'Le Wagon')

Creation.create(nom:'Lions Club', creation_type: "Affiches web et print"    , description: 'fpzjefohzlfhzeofnoizejfiozej', photos: 'lions2.jpg', date:'Mars 2023', logiciel:'Adobe ID, AI et PS', poste_occupe: 'Infographiste', entreprise: 'Auto-entrepreneur')

Creation.create(nom:'Gorillas', creation_type: "Newsletters et t-shirts"    ,description: 'zfezefzefzefzefzefzefzefze', photos: 'gorillas2.jpg', date:'2021 à 2023', logiciel:'Adobe ID, AI et PS', poste_occupe: 'Warehouse Supervisor', entreprise: 'Gorillas')

Creation.create(nom:'Plug & Play', creation_type: "Catalogues produits"   ,description: 'efzfedzefezafzefzefze', photos: 'plug2.jpg', date:'2015 à 2019', logiciel:'Adobe ID, AI et PS', poste_occupe: 'Infographiste', entreprise: 'Auto-entrepreneur')

Creation.create(nom:'Créations', creation_type: "thdger"   ,description: 'zefzefezfzefzfzefezfzefz', photos: 'alexcrea2.jpg', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'FotoBorne', creation_type: "Supports Marketing"   ,description: 'efzfzefzefzefzfeezfezf', photos: 'fotoborne2.jpg', date:'2015 à 2020', logiciel:'Adobe ID, AI et PS', poste_occupe: 'Infographiste', entreprise: 'Fotoborne Animation')

Creation.create(nom:'Mes dessins', creation_type: "Dessins PAO", format:"paysage"  ,description: 'zefzefzefzefzefzefzefez', photos: 'dessins.jpg', date:'2010 à 2023', logiciel:'Adobe IA, ID', poste_occupe: 'Infographiste', entreprise: 'Auto-entrepreneur')

Creation.create(nom:'Autres', creation_type: "sdfz"   ,description: 'efzfzefzefzefzfeezfezf', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')





p "-------------- #{Creation.count} creations created--------------"
puts 'Finished!'
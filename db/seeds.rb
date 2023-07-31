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


Creation.create(nom:'City Break', description: 'Un escape game à faire dans les rues de Lille pour découvrir découvrir l histoire de la ville tout en s amusant', photos: "city_break_carre.jpg", date:'Juin 2023', logiciel:'Ruby on Rails', poste_occupe: 'Etudiant', entreprise: 'Le Wagon')

Creation.create(nom:'Tournoi de Golf Lions Club', description: 'fpzjefohzlfhzeofnoizejfiozej', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'Catalogues Plug and Play', description: 'efzfedzefezafzefzefze', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'Faire part Mariages', description: 'zefzefezfzefzfzefezfzefz', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'Newsletter Gorillas', description: 'zfezefzefzefzefzefzefzefze', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'T-shirt Gorillas', description: 'zefzefzefzefzefzefzefez', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'Flyers FotoBorne Animation', description: 'efzfzefzefzefzfeezfezf', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'Stickers Bornes Photos', description: '', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'lol', description: '', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'lol', description: '', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'lol', description: '', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'lol', description: '', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'lol', description: '', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'lol', description: '', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'lol', description: '', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')

Creation.create(nom:'lol', description: '', photos: '', date:'', logiciel:'', poste_occupe: '', entreprise: '')




p "-------------- #{Creation.count} creations created--------------"
puts 'Finished!'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
persona = Persona.create([{ nombre: 'Valdomero' }, { edad:20 }, { cargo:"Mercologo" }] )

20.times do |i|
    Persona.create(
        nombre: "Persona numero #{i+1}",
        edad: 18,
        cargo: "Cargo #{i+1}")
end
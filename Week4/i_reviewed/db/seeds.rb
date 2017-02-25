# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.destroy_all

Book.create! [
 { name: "Elouquent Ruby", author: "Russ Olsen" },
 { name: "Beginning Ruby", author: "Peter Cooper" },
 { name: "Metaprogramming Ruby 2", author: "Paolo Perotta" },
 { name: "Design Patterns in Ruby", author: "Russ Olsen" },
 { name: "The Ruby Programming Language", author: "David Flanagan" },
]
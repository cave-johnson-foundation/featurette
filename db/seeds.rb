# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

apps = App.create([
  { name: 'Diaroogle', url: 'http://www.diaroogle.com' },
  { name: 'Twitter', url: 'http://www.twitter.com' },
  { name: 'Github', url: 'http://www.github.com' } 
])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
   cities = City.create([{ name: 'Москва' },
                         { name: 'Санкт-Петербург' },
                         { name: 'Новосибирск' },
                         { name: 'Екатеринбург' },
                         { name: 'Нижний Новгород' },
                         { name: 'Казань' },
                         { name: 'Самара' },
                         { name: 'Омск' },
                         { name: 'Челябинск' },
                         { name: 'Ростов-на-Дону' },
                         { name: 'Уфа' },
                         { name: 'Волгоград' },
                         { name: 'Красноярск' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'test@admin', password: 'teamII')

#Genre.create!(id: 1, genre_name: 'ケーキ')
#Genre.create!(id: 2, genre_name: 'プリン')
#Genre.create!(id: 3, genre_name: '焼き菓子')

#Item.create!(genre_id: 1, name: 'ケーキ', detail: 'ケーキです', tax_free: 3500)
#Item.create!(genre_id: 2, name: 'プリン', detail: 'プリンです', tax_free: 400)
#Item.create!(genre_id: 3, name: '焼き菓子', detail: '焼き菓子です', tax_free: 3500)

Cart.create!(customer_id: 3, item_id: 1, count: 2)
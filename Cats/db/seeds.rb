# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

cat1 = Cat.create(name: "Buster", birth_date: "2010/01/20", sex: 'M', color: 'Black', description: 'VERY lucky cat!')
cat2 = Cat.create(name: "Kas", birth_date: "2010/02/10", sex: 'M', color: 'Brown', description: 'Lazy fatty cat')

CatRentalRequest.destroy_all
cr1 = CatRentalRequest.create(cat_id: cat1.id, start_date: "2017/4/17", end_date: "2017/4/21", status: "APPROVED")
cr2 = CatRentalRequest.create(cat_id: cat2.id, start_date: "2017/4/01", end_date: "2017/4/05", status: "APPROVED")
cr3 = CatRentalRequest.create(cat_id: cat2.id, start_date: "2017/5/10", end_date: "2017/5/20")
cr4 = CatRentalRequest.create(cat_id: cat2.id, start_date: "2017/5/10", end_date: "2017/5/20")
cr5 = CatRentalRequest.create(cat_id: cat2.id, start_date: "2017/5/10", end_date: "2017/5/20")

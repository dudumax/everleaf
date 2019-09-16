# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
   Task.create( title: 'Kentaro' , inquiry: 'his age is 24 years old' , deadline: '2020/03/02' , status: 'Undertaking' )
   Task.create( title: 'Yamaguchi' , inquiry: 'his age is 24.5 years old' , deadline: '2019/03/02' , status: 'Not_started' )
   Task.create( title: 'Osaka' , inquiry: 'his age is 28 years old' , deadline: '2019/03/09' , status: 'Completed' )
   Task.create( title: 'Tomooka' , inquiry: 'his age is 29 years old' , deadline: '2019/03/07' , status: 'Undertaking' )


   
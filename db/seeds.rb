# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#//////////households

household1 = Household.create(name:"Household-1")
household2 = Household.create(name:"Household-2")
household3 = Household.create(name:"Household-3")
household4 = Household.create(name:"Household-4")

# USERS////////////////////

user1 = User.create(username:'Louis',password:"lol",household_id:1)
user2 = User.create(username:'Gabriel',password:"1",household_id:1)
user3 = User.create(username:'Hugo',password:'lol',household_id:1)
user4 = User.create(username:'Jigar',password:"lol",household_id:1)
user5 = User.create(username:'Allegra',password:"lol",household_id:1)
user6 = User.create(username:'Lucy',password:"lol",household_id:1)
user7 = User.create(username:'Marju',password:"lol",household_id:1)


# /////////EXPENSES

expenses1 = Expense.create(user_id: 1, date: DateTime.new() , amount:230, purchase: "Hoover", description: "Replacement hoover, since you guys broke Henry")
expenses2 = Expense.create(user_id: 1, date:DateTime.new(3,4,5), amount:420, purchase: "Drinks", description: "Alcohol and mixers for that banging party we're gonna throw")
expenses3 = Expense.create(user_id: 2, date:DateTime.new(), amount:239, purchase: "Dog", description: "This house needed something uplifting!")
expenses4 = Expense.create(user_id: 4, date:DateTime.new(2,3,5), amount:212, purchase: "Cat", description: "The dog needed a friend")
expenses5 = Expense.create(user_id: 1, date:DateTime.new(), amount:1029, purchase: "StarWars figurine", description: "It's a collectable, ok? It's an investment")
expenses6 = Expense.create(user_id: 3, date:DateTime.new(2,2,2), amount:123, purchase: "House Cleaning", description: "You know why...")
expenses7 = Expense.create(user_id: 7, date:DateTime.new(), amount:323, purchase: "TV", description: "I'm tired of having to talk to you guys if I'm in the living room")
expenses8 = Expense.create(user_id: 5, date:DateTime.new(), amount:12, purchase: "Toilet Paper", description: "")


#/////////Payments////////////

# payment1= Payment.create(user_id:1,expense_id:1,amount: 705, paid: true)
# payment2= Payment.create(user_id:3,expense_id:2,amount: 703, paid: false)
# payment3= Payment.create(user_id:2,expense_id:3,amount: 702, paid: true)
# payment4= Payment.create(user_id:2,expense_id:4,amount: 703, paid: true)
# payment5= Payment.create(user_id:4,expense_id:5,amount: 703, paid: false)
# payment6= Payment.create(user_id:5,expense_id:6,amount: 740, paid: true)
# payment7= Payment.create(user_id:6,expense_id:7,amount: 730, paid: true)
# payment8= Payment.create(user_id:4,expense_id:8,amount: 720, paid: false)

puts "--------------"
puts "--- Seeded ---"
puts "--------------"

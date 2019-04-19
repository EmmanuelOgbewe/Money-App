# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Payment.destroy_all
# user1 = User.create email:"email1",password:"password"
# user2 = User.create email:"email2",password:"password"
# user3 = User.create email:"email3",password:"password"

payment1 = Payment.create(sender_id: user1.id, recipient_id: user2.id, amount: 1.99)
payment2 = Payment.create(sender_id: user2.id, recipient_id: user1.id, amount: 2.99)
payment3 = Payment.create(sender_id: user3.id, recipient_id: user1.id, amount: 3.99)
payment4 = Payment.create(sender_id: user2.id, recipient_id: user3.id, amount: 4.99)
payment5 = Payment.create(sender_id: user1.id, recipient_id: user3.id, amount: 5.99)
payment6 = Payment.create(sender_id: user3.id, recipient_id: user2.id, amount: 6.99)
# payment1 = Payment.create(sender: user1, recipient: user2, amount: 10.99)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(
  email: 'test@example.com',
  name: 'Test Taiko Team',
  password: 'secret',
  password_confirmation: 'secret')

bobby = Member.create!(name: 'Bobby Lee', user: user,)
anna = Member.create!(name: 'Anna Belle', user: user,)
freddy = Member.create!(name: 'Freddy Mercury', user: user,)
george = Member.create!(name: 'George Washington', user: user,)
sam = Member.create!(name: 'Samantha Sue', user: user,)
afro = Member.create!(name: 'Afro Jack', user: user,)

InstrumentType.create!(
  name: 'Chu', shape: 0, color: '#FFF', size: 10, user: user)
InstrumentType.create!(
  name: 'Shime', shape: 0, color: '#FFF', size: 5, user: user)
InstrumentType.create!(
  name: 'Odaiko', shape: 0, color: '#FFF', size: 15, user: user)

Performance.create!(
  title: 'San Potato Obon Festival', date: Date.today + 12.days,
  user: user, members: Member.all)
Performance.create!(
  title: "Jim & Carlie's Wedding", date: Date.today + 20.days,
  user: user, members: Member.all)
Performance.create!(
  title: 'Back-to-school Rally', date: Date.today + 45.days,
  user: user, members: Member.all)

StageLayout.create!(name: 'Raimei', user: user)
StageLayout.create!(name: 'Shingetsu', user: user)
StageLayout.create!(name: 'Honba', user: user)

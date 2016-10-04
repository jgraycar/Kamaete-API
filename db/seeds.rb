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

Member.create!([
  { name: 'Bobby Lee', user: user },
  { name: 'Anna Belle', user: user },
  { name: 'Freddy Mercury', user: user },
  { name: 'George Washington', user: user },
  { name: 'Samantha Sue', user: user },
  { name: 'Afro Jack', user: user },
  { name: 'Jenny McGee', user: user },
  { name: 'Patrick Henry', user: user },
  { name: 'Tara Tamborine', user: user },
  { name: 'Son Goku', user: user },
  { name: 'Fred Rice', user: user },
  { name: 'Otis Redding', user: user },
])

chu = Instrument.create!({
  kind: 'Chu',
  shape: Instrument.shapes['ellipse'],
  color: '#355aec',
  angle: 0,
  width: 23,
  height: 23,
  user: user,
  template: true,
})
shime = Instrument.create!({
  kind: 'Shime',
  shape: Instrument.shapes['ellipse'],
  color: '#0ef400',
  angle: 0,
  width: 14,
  height: 14,
  user: user,
  template: true,
})
odaiko = Instrument.create!({
  kind: 'Odaiko',
  shape: Instrument.shapes['ellipse'],
  color: '#6720cc',
  angle: 0,
  width: 30,
  height: 30,
  user: user,
  template: true,
})
upright_stand = Instrument.create!({
  kind: 'Upright Stand',
  shape: Instrument.shapes['rectangle'],
  color: '#811616',
  angle: 0,
  width: 45,
  height: 10,
  user: user,
  template: true,
})
slant_stand = Instrument.create!({
  kind: 'Slant Stand',
  shape: Instrument.shapes['cross'],
  color: '#811616',
  angle: 170,
  width: 40,
  height: 15,
  user: user,
  template: true,
})
shime_stand = Instrument.create!({
  kind: 'Shime Stand',
  shape: Instrument.shapes['rectangle'],
  color: '#7400ff',
  angle: 0,
  width: 20,
  height: 30,
  user: user,
  template: true,
})
odaiko_stand = Instrument.create!({
  kind: 'Odaiko Stand',
  shape: Instrument.shapes['cross'],
  color: '#811616',
  angle: 0,
  width: 40,
  height: 40,
  user: user,
  template: true,
})

Performance.create!(
  title: 'San Potato Obon Festival', date: Date.today + 12.days,
  user: user, members: Member.all.shuffle[0..5])
Performance.create!(
  title: "Jim & Carlie's Wedding", date: Date.today + 20.days,
  user: user, members: Member.all.shuffle[0..8])
Performance.create!(
  title: 'Back-to-school Rally', date: Date.today + 45.days,
  user: user, members: Member.all.shuffle[0..6])

raimei_instruments = []
6.times do |num|
  drum = chu.create_instance
  drum.label = "Chu #{num + 1}"
  stand = upright_stand.create_instance
  stand.label = "Chu #{num + 1} Stand"

  if num < 3
    drum.x = 100 + 100 * num
    drum.y = 300 - 40 * num
    stand.x = 100 + 100 * num
    stand.y = 325 - 40 * num
  else
    drum.x = 500 + 100 * (num - 3)
    drum.y = 220 + 40 * (num - 3)
    stand.x = 500 + 100 * (num - 3)
    stand.y = 245 + 40 * (num - 3)
  end

  raimei_instruments << drum
  raimei_instruments << stand
end
2.times do |num|
  drum = shime.create_instance
  drum.label = "Shime #{num + 1}"
  drum.x = 385 + 30 * num
  drum.y = 150
  raimei_instruments << drum
end

StageLayout.create!(name: 'Raimei', user: user,
  instruments: raimei_instruments)
StageLayout.create!(name: 'Shingetsu', user: user)
StageLayout.create!(name: 'Honba', user: user)

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

chu = {
  name: 'Chu',
  shape: 'circle',
  color: '#FFF',
  size: 10,
  user: user,
}
shime = {
  name: 'Shime',
  shape: 'circle',
  color: '#FFF',
  size: 5,
  user: user,
}
odaiko = {
  name: 'Odaiko',
  shape: 'circle',
  color: '#FFF',
  size: 15,
  user: user,
}
upright_stand = {
  name: 'Upright Stand',
  shape: 'rectangle',
  color: '#FFF',
  size: 3,
  user: user,
}
slant_stand = {
  name: 'Slant Stand',
  shape: 'rectangle',
  color: '#FFF',
  size: 3,
  user: user,
}
shime_stand = {
  name: 'Shime Stand',
  shape: 'rectangle',
  color: '#FFF',
  size: 2,
  user: user,
}
odaiko_stand = {
  name: 'Odaiko Stand',
  shape: 'rectangle',
  color: '#FFF',
  size: 4,
  user: user,
}
InstrumentType.create!(chu)
InstrumentType.create!(shime)
InstrumentType.create!(odaiko)
InstrumentType.create!(upright_stand)
InstrumentType.create!(slant_stand)
InstrumentType.create!(shime_stand)
InstrumentType.create!(odaiko_stand)


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
  raimei_instruments << {
    label: "Chu #{num + 1}",
    size: chu[:size],
    shape: chu[:shape],
    color: chu[:color],
    x: 10,
    y: 10,
    angle: 0,
  }
  raimei_instruments << {
    label: "Chu #{num + 1} Stand",
    size: upright_stand[:size],
    shape: upright_stand[:shape],
    color: upright_stand[:color],
    x: 10,
    y: 10,
    angle: 0,
  }
end
2.times do |num|
  raimei_instruments << {
    label: "Shime #{num + 1}",
    size: shime[:size],
    shape: shime[:shape],
    color: shime[:color],
    x: 10,
    y: 10,
    angle: 0,
  }
  raimei_instruments << {
    label: "Shime #{num + 1} Stand",
    size: shime_stand[:size],
    shape: shime_stand[:shape],
    color: shime_stand[:color],
    x: 10,
    y: 10,
    angle: 0,
  }
end

StageLayout.create!(name: 'Raimei', user: user,
  instruments: Instrument.create(raimei_instruments))
StageLayout.create!(name: 'Shingetsu', user: user)
StageLayout.create!(name: 'Honba', user: user)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Concert.destroy_all
Band.destroy_all

15.times do
    band = Band.create(name: Faker::Music::RockBand.name,
                kind: [0,1].sample,
                start_date: Faker::Date.between(from: '1951-01-01', to: Date.today - 1.year))
    puts "Se ha creado la banda: #{band.name}"

    (10..25).to_a.sample.times do |j|
        concert = band.concerts.build(location: Faker::Address.city,
                            date: Faker::Date.between(from: '1951-01-01', to: Date.today - 1.year),
                            quantity: (10..25).to_a.sample,
                            duration: (1..4).to_a.sample)
        concert.save
        puts "Concierto en: #{concert.location} "
    end
end
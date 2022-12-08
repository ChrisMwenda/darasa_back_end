puts "🌱 Seeding..."


  10.times do
   Teacher.create(
      name: Faker::Name.name(),
      phone_number: Faker::Number.number(digits: 10),
      subject: :"Science"
      img_url: Faker::Avatar.image
    )
  end

  puts "✅ Done seeding!"
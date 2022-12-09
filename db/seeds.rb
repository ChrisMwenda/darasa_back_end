puts "🌱 Seeding..."
   Teacher.create!([
    {
        name: 'Irene Gitau',
        subject: 'Geography',
        image_url: ''
    },
    {
        name: 'Gina Muthoni',
        subject: 'Sociology',
        image_url: '' 
    },
    {
        name: 'Chris Mwenda',
        subject: 'Philosophy',
        image_url: '' 
    },
    {
        name: 'Jordan Peterson',
        subject: 'Pyschology',
        image_url: '' 
    }
    ]
      )

  puts "✅ Done seeding!"
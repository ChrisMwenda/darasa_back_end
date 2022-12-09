# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
 
User.create!(
    {username: "christopher", password: "chris@007"}
    )

Review.create!(
    {teacher_name: "Beatrice Wambui",title: "Front-end design with React", image_url: "https://media.istockphoto.com/id/1287464946/vector/strong-black-woman-with-curly-hair-smiles-and-looks-directly-confident-young-woman-with.jpg?s=612x612&w=0&k=20&c=ZsblOZ1JE0ZAPS-LPZmlJbfyR5_2PZ6wx-7XH6SOr6I=",comment: "Bobo is a very thoughtful teacher who puts a lot of thought into how she presents the material.", user_id: user1.id }
    
    )
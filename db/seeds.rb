# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'production'
  
  User.create!(name:  "Test User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

  99.times do |n|
   name  = "ユーザー#{n+1}"
   email = "example-#{n+1}@railstutorial.org"
   password = "password"
   User.create!(name:  name,
                email: email,
                password:              password,
                password_confirmation: password)
  end
   
  (1..20).each do |i|
    user = User.first
    user.boards.create!(name: "#{user.name}", title: "タイトル#{i}", body: "本文#{i}")
  end
  
  Tag.create([
    { name: "プログラミング" },
    { name: "エンタメ" },
    { name: "スポーツ" },
    { name: "雑談" },
    { name: "趣味" },
    { name: "相談" }
  ])
   
end
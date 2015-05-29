namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
#    User.create!(name: "User from gem `faker`",
#                 email: "example_mail2@railstutorial.org",
#                 password: "foobar",
#                 password_confirmation: "foobar")
    30.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+115}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.limit(6)
    30.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end

  end
end

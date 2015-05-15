namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
#    User.create!(name: "User from gem `faker`",
#                 email: "example_mail2@railstutorial.org",
#                 password: "foobar",
#                 password_confirmation: "foobar")
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+115}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
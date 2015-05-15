namespace :db do
  desc "Add to database admin user"
  task create_admin: :environment do
    admin = User.create!(name: "admin2 user",
                         email: "admin2@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
   end
end

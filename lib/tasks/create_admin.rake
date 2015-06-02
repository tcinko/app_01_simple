namespace :db do
  desc "Add to database admin user"
  task create_admin: :environment do
    admin = User.create!(name: "admin",
                         email: "admin@email.com",
                         password: "111",
                         password_confirmation: "111",
                         admin: true)
    name4 = User.create!(name: "name4",
                         email: "name4@email.com",
                         password: "444",
                         password_confirmation: "444")
   end
end

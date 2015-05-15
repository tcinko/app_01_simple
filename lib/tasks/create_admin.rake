namespace :db do
  desc "Add to database admin user"
  task create_admin: :environment do
    admin = User.create!(name: "admin",
                         email: "admin@email.com",
                         password: "111",
                         password_confirmation: "111",
                         admin: true)
   end
end

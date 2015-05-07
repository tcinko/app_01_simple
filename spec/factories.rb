# Объект класса `User`  для тестов

FactoryGirl.define do
  factory :user do
    name     "Factory Girl User"
    email    "test@example.com"
    password "factory girl"
    password_confirmation "factory girl"
  end
end

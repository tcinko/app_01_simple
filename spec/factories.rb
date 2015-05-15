# Объект класса `User`  для тестов

#FactoryGirl.define do
#  factory :user do
#    name     "Factory Girl User"
#    email    "test@example.com"
#    password "factory girl"
#    password_confirmation "factory girl"
#  end
#end


FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
	admin true
    end
  end
end

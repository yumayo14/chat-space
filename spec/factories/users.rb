FactoryGirl.define do
  factory :user do
    name                  { Faker::Name.name }
    email                 "mmm@gmail.com"
    password              "00000000"
    password_confirmation "00000000"
  end
end

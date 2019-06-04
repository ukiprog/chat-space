FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
    sequence(:email) {Faker::Internet.email}
  end
end
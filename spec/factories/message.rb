FactoryBot.define do
  factory :message do
    text {Faker::Lorem.sentence}
    image {File.open("#{Rails.root}/public/uploads/message/image/3/519866.jpg")}
    user
    group
  end
end
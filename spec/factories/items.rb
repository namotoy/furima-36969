FactoryBot.define do
  factory :item do
    image              { Faker::Lorem.sentence }
    title              { Faker::Lorem.sentence }
    explanation        { Faker::Lorem.sentence }
    category_id        { '1' }
    situation_id       { '1' }
    delively_charge_id { '1' }
    prefecture_id      { '1' }
    shipping_days_id   { '1' }
    price              { '3333' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename:'test_image.png')
    end
  end
end

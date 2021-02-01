FactoryBot.define do
  factory :item do
    image              { Faker::Lorem.sentence }
    item_name          { 'トラの写真' }
    explain            { 'トラを捕まえたときの写真です' }
    price              { 3500 }
    category_id           { 2 }
    condition_id          { 2 }
    fee_id                { 2 }
    prefecture_id         { 2 }
    day_id                { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

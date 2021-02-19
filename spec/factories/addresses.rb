FactoryBot.define do
  factory :address do
    postal_code             { 123-4567 }
    prefecture_id           { 2 }
    city                    { '横浜市緑区' }
    house_number            { '青山1-1-1' }
    building_name           { '柳ビル103' }
    phone_number            { '09012345678' }
    association :user
    association :order
  end
end

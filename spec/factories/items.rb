FactoryBot.define do
  factory :item do
    name               { "item" }
    introduction       { "introduction" }
    price              { 300 }
    category_id        { 2 }
    item_condition_id  { 2 }
    postage_payer_id   { 2 }
    shipping_area_id   { 2 }
    preparation_day_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

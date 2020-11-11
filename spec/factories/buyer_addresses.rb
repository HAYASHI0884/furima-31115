FactoryBot.define do
  factory :buyer_address do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '123-4567' }
    prefectures_id { 1 }
    municipality   { '市' }
    address_number { '番地' }
    building_name  { '建物名' }
    phone_number   { '09012345678' }
  end
end

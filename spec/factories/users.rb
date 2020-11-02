FactoryBot.define do
  factory :user do
    nickname              { 'furima太郎' }
    email                 { 'aaa@gmail.com' }
    password              { '1111aaaa' }
    password_confirmation { password }
    lastname              { '山田' }
    firstname             { '太郎' }
    lastname_kana         { 'ヤマダ' }
    firstname_kana        { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end

FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    name { "Mr. Customer" }
    cif { "RO12312343" }
    reg { "112/123/2020" }
    address { "Main Str. 2nd" }
    city { "Cluj" }
    state { "CA" }
    country { "Romania" }
    zip { "300124" }
    bank { "ING-Customer" }
    iban { "IBAN54321" }
    user
  end
end

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "secreT123" }
    company { "Mr. User" }
    cif { "RO12312341" }
    reg { "112/123/2000" }
    address { "Main Str. 1st" }
    city { "Timisoara" }
    state { "TM" }
    country { "Romania" }
    zip { "300123" }
    bank { "ING-Client" }
    iban { "IBAN12345" }
  end
end

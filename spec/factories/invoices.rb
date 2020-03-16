FactoryBot.define do
  factory :invoice do
    number { generate(:invoice_number) }
    date { Time.current }
    customer
  end
end

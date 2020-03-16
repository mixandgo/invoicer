FactoryBot.define do
  sequence :invoice_number do |n|
    "INV#{n}"
  end
end

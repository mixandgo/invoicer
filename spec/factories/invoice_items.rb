FactoryBot.define do
  factory :invoice_item do
    description { "InvoiceItem Description" }
    unit { "day" }
    quantity { 1 }
    price { 100 }
  end
end

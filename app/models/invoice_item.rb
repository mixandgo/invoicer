class InvoiceItem < ApplicationRecord
  belongs_to :invoice

  def total
    price * quantity * Constants::TAX
  end
end

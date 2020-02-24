class InvoiceItem < ApplicationRecord
  belongs_to :invoice

  validates :description, presence: true
  validates :quantity, presence: true
  validates :unit, presence: true
  validates :price, presence: true
  validates :tax, presence: true

  def total
    price * quantity * Constants::TAX
  end
end

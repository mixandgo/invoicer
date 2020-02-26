class InvoiceItem < ApplicationRecord
  belongs_to :invoice

  validates :description, presence: true
  validates :quantity, presence: true
  validates :unit, presence: true
  validates :price, presence: true

  before_save :set_tax

  def total
    price * quantity + calculate_tax
  end

  private

    def total_without_tax
      price * quantity
    end

    def calculate_tax
      (total_without_tax * Constants::TAX) / 100
    end

    def set_tax
      self.tax = calculate_tax
    end
end

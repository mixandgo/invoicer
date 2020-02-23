class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_items, dependent: :destroy

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :invoice_items

  before_validation :calculate_total

  private

    def calculate_total
      self.total = invoice_items.map(&:total).sum
    end
end

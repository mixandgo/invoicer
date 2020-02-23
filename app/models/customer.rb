class Customer < ApplicationRecord
  has_many :invoices, dependent: :destroy
  belongs_to :user
end

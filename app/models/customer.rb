class Customer < ApplicationRecord
  has_many :invoices, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :email, presence: true
end

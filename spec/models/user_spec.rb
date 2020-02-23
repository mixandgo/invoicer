require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:customers).dependent(:destroy) }
  it { is_expected.to have_many(:invoices).through(:customers) }
end

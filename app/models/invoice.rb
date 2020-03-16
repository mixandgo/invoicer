class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_items, dependent: :destroy

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :invoice_items

  before_validation :calculate_total

  validates :number, uniqueness: true, presence: true
  validates :date, presence: true

  def pdf
    return unless persisted?

    pdf = Prawn::Document.new
    pdf.text I18n.t("invoices.pdf.title")
    pdf.render_file "tmp/invoice_#{id}.pdf"
    File.read("tmp/invoice_#{id}.pdf")
  end

  private

    def calculate_total
      self.total = invoice_items.map(&:total).sum
    end
end

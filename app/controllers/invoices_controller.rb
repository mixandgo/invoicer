class InvoicesController < ApplicationController
  def new
    customer = Customer.new
    @invoice = Invoice.new(customer: customer)
    @invoice.invoice_items.build
  end

  def index
    @invoices = current_user.invoices
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.customer.user_id = current_user.id

    if @invoice.save
      redirect_to invoices_path, notice: t(".success")
    else
      binding.pry
    end
  end

  private

    def invoice_params
      params
        .require(:invoice)
        .permit(:number, :date,
                customer_attributes: [
                  :name, :email, :city, :cif, :reg, :address, :state, :country,
                  :zip
                ],
                invoice_items_attributes: [:description, :quantity, :price])
    end
end

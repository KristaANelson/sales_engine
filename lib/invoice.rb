class Invoice
attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :parent

  def initialize(row, parent)
    @id           = row[:id].to_i
    @customer_id  = row[:customer_id].to_i
    @merchant_id  = row[:merchant_id].to_i
    @status       = row[:status]
    @created_at   = row[:created_at]
    @updated_at   = row[:updated_at]
    @parent       = parent
  end

  def transactions
    parent.find_transactions_using_id(id)
  end

  def items
    parent.find_items_using_id(id)
  end

  def customer
    parent.find_customer_using_customer_id(customer_id)
  end

  def invoice_items
    parent.find_invoice_items_using_invoice_id(id)
  end
end

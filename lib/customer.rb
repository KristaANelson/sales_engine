class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :parent

  def initialize(row, parent)
    @id         = row[:id].to_i
    @first_name = row[:first_name]
    @last_name  = row[:last_name]
    @created_at = Date.parse(row[:created_at])
    @updated_at = Date.parse(row[:updated_at])
    @parent     = parent
  end

  def invoices
     parent.find_invoices_using(id)
  end

  def transactions
    parent.find_transactions_using_customer_id(id)
  end

  def favorite_merchant
    parent.find_favorite_merchant_using_customer_id(id)
  end
end

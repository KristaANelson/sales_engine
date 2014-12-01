class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :parent

  def initialize(row, parent)
    @id         = row[:id].to_i
    @first_name = row[:first_name]
    @last_name  = row[:last_name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @parent     = parent
  end

  def invoices
     parent.find_invoices_using(id)
  end
end

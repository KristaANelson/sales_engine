class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :parent

  def initialize(row, parent)
    @id         = row[:id].to_i
    @name       = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @parent     = parent
  end

  def items
    parent.find_items_using(id)
  end

  def invoices
    parent.find_invoices_using(id)
  end
end

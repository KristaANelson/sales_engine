class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :parent

  def initialize(row, parent)
    @id           = row[:id].to_i
    @name         = row[:name]
    @description  = row[:description]
    @unit_price   = BigDecimal.new(row[:unit_price])/100
    @merchant_id  = row[:merchant_id].to_i
    @created_at   = row[:created_at]
    @updated_at   = row[:updated_at]
    @parent       = parent
  end

  def invoice_items
    parent.find_invoice_items_using_item_id(id)
  end

  def merchant
    parent.find_merchant_using_merchant_id(merchant_id)
  end
end

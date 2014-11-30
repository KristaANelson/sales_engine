class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :parent

  def initialize(row, parent)
    @id           = row[:id]
    @name         = row[:name]
    @description  = row[:description]
    @unit_price   = row[:unit_price]
    @merchant_id  = row[:merchant_id]
    @created_at   = row[:created_at]
    @updated_at   = row[:updated_at]
    @parent       = parent
  end
end

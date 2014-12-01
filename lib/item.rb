class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :parent

  def initialize(row, parent)
    @id           = row[:id].to_i
    @name         = row[:name]
    @description  = row[:description]
    @unit_price   = BigDecimal.new("#{row[:unit_price][0...-2]}.#{row[:unit_price][-2..-1]}")
    @merchant_id  = row[:merchant_id].to_i
    @created_at   = row[:created_at]
    @updated_at   = row[:updated_at]
    @parent       = parent
  end
end

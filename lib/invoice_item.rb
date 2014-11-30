class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at, :parent

  def initialize(row, parent)
    @id          = row[:id]
    @item_id     = row[:item_id]
    @invoice_id  = row[:invoice_id]
    @quantity    = row[:quantity]
    @unit_price  = row[:unit_price]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @parent      = parent
  end
end

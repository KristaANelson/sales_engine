class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at, :parent

  def initialize(row, parent)
    @id          = row[:id].to_i
    @item_id     = row[:item_id].to_i
    @invoice_id  = row[:invoice_id].to_i
    @quantity    = row[:quantity].to_i
    @unit_price  = row[:unit_price].to_i
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @parent      = parent
  end

  def item
    parent.find_item_using(item_id)
  end

  def invoice
    parent.find_invoice_using(invoice_id)
  end
end

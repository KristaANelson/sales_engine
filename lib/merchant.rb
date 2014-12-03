class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :parent

  def initialize(row, parent)
    @id         = row[:id].to_i
    @name       = row[:name]
    @created_at = Date.parse(row[:created_at])
    @updated_at = Date.parse(row[:updated_at])
    @parent     = parent
  end

  def items
    parent.find_items_using(id)
  end

  def invoices
    parent.find_invoices_using(id)
  end

  def total_items_sold_for_a_merchant
    all_successful_invoice_items.reduce(0) {|sum, invoice_item| sum + invoice_item.quantity}
  end

  def all_successful_invoice_items
    invoices.select {|invoice| invoice.charged?}.map {|invoice| invoice.invoice_items}.flatten
  end

  def revenue(date = "all")
    successful_invoice_items_by_date(date).reduce(0) {|sum, invoice_item| sum + (invoice_item.quantity * invoice_item.unit_price)}
  end

  def successful_invoice_items_by_date(date)
    return all_successful_invoice_items if date == "all"
    all_successful_invoice_items.select {|invoice_item| invoice_item.invoice.created_at == date}
  end
end

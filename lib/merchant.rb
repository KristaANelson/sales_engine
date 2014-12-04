require 'pry'
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
    all_successful_invoice_items.reduce(0) do |sum, invoice_item|
       sum + invoice_item.quantity
     end
  end

  def all_successful_invoice_items
    all_successful_invoices.map {|invoice| invoice.invoice_items}.flatten
  end

  def all_successful_invoices
    invoices.select {|invoice| invoice.charged?}
  end

  def revenue(date = "all")
    successful_invoice_items_by_date(date).reduce(0) do |sum, invoice_item|
      sum + (invoice_item.quantity * invoice_item.unit_price)
    end
  end

  def successful_invoice_items_by_date(date)
    return all_successful_invoice_items if date == "all"
    all_successful_invoice_items.select do |invoice_item|
      invoice_item.invoice.created_at == date
    end
  end

  def favorite_customer
    find_customers_using_customer_id(favorite_customer_id)
  end

  def favorite_customer_id
    customer_frequencies.sort_by {|customer_id, instances| instances}.last.first
  end

  def customer_frequencies
    all_successful_invoices.reduce(Hash.new(0)) do |hash, invoice|
      hash[invoice.customer_id] +=1
      hash
    end
  end

  def find_customers_using_customer_id(customer_id)
    parent.find_customers_using_customer_id(customer_id)
  end

  def customers_with_pending_invoices
    unsuccessful_invoices.map {|invoice| invoice.customer}.uniq
  end

  def unsuccessful_invoices
    invoices - all_successful_invoices
  end
end

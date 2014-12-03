class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at,
              :parent

  def initialize(row, parent)
    @id         = row[:id].to_i
    @invoice_id = row[:invoice_id].to_i
    @credit_card_number = row[:credit_card_number]
    @credit_card_expiration_date = row[:credit_card_expiration_date]
    @result     = row[:result]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @parent     = parent
  end

  def invoice
    parent.find_invoices_using(invoice_id)
  end

  def success?
    result == "success"
  end
end

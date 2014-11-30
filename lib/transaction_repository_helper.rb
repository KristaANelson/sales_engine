require 'pry'

module TransactionRepositoryHelper


  def find_by_invoice_id(criteria)
    find_by(:invoice_id, criteria)
  end

  def find_by_credit_card_number(criteria)
    find_by(:credit_card_number, criteria)
  end

  def find_by_credit_card_expiration_date(criteria)
    find_by(:credit_card_expiration_date, criteria)
  end

  def find_by_result(criteria)
    find_by(:result, criteria)
  end
end

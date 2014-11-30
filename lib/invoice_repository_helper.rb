module InvoiceRepositoryHelper
  def find_by_customer_id(criteria)
    find_by(:customer_id, criteria)
  end

  def find_by_merchant_id(criteria)
    find_by(:merchant_id, criteria)
  end

  def find_by_status(criteria)
    find_by(:status, criteria)
  end

  def find_all_by_customer_id(criteria)
    find_all_by(:customer_id, criteria)
  end

  def find_all_by_merchant_id(criteria)
    find_all_by(:merchant_id, criteria)
  end

  def find_all_by_status(criteria)
    find_all_by(:status, criteria)
  end
end

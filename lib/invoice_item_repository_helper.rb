module InvoiceItemRepositoryHelper
  
  def find_by_item_id(criteria)
    find_by(:item_id, criteria)
  end

  def find_by_invoice_id(criteria)
    find_by(:invoice_id, criteria)
  end

  def find_by_quantity(criteria)
    find_by(:quantity, criteria)
  end

  def find_by_unit_price(criteria)
    find_by(:unit_price, criteria)
  end

  def find_all_by_item_id(criteria)
    find_all_by(:item_id, criteria)
  end

  def find_all_by_invoice_id(criteria)
    find_all_by(:invoice_id, criteria)
  end

  def find_all_by_quantity(criteria)
    find_all_by(:quantity, criteria)
  end

  def find_all_by_unit_price(criteria)
    find_all_by(:unit_price, criteria)
  end
end

module InvoiceItemRepositoryHelper
  def load_repository
    @repository = load_file(filename, InvoiceItem)
  end

  def find_by_item_id(criteria)
    find_by(:item_id, criteria)
  end

  def find_by_invoice_id(criteria)
    find_by(:first_name, criteria)
  end

  def find_by_quantity(criteria)
    find_by(:quatity, criteria)
  end

  def find_by_unit_price
    find_by(:unit_price, criteria)
  end

  def find_all_by_item_id(criteria)
    find__by(:item_id, criteria)
  end

  def find_all_by_invoice_id(criteria)
    find_by_all(:invoice_id, criteria)
  end

  def find_all_by_quantity(criteria)
    find_by_all(:quantity, criteria)
  end

  def find_all_by_unit_price(criteria)
    find_all_by(:unit_price, criteria)
  end
end

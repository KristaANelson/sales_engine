module ItemRepositoryHelper
  def find_by_name(criteria)
    find_by(:name, criteria)
  end

  def find_by_description(criteria)
    find_by(:description, criteria)
  end

  def find_by_unit_price(criteria)
    find_by(:unit_price, criteria)
  end

  def find_by_merchant_id(criteria)
    find_by(:merchant_id, criteria)
  end

  def find_all_by_name(criteria)
    find_all_by(:name, criteria)
  end

  def find_all_by_description(criteria)
    find_all_by(:description, criteria)
  end

  def find_all_by_unit_price(criteria)
    find_all_by(:unit_price, criteria)
  end

  def find_all_by_merchant_id(criteria)
    find_all_by(:merchant_id, criteria)
  end
end

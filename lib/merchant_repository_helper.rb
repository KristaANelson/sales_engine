require 'pry'

module MerchantRepositoryHelper
  def find_by_name(criteria)
    find_by(:name, criteria)
  end

  def find_all_by_name(criteria)
    find_all_by(:name, criteria)
  end
end

require_relative 'test_helper'
require 'csv'
require 'merchant_repository'


class MerchantRepoTest < Minitest::Test

  def test_load_file_method_and_that_it_loads_rows
    merchant_repo = MerchantRepo.new
    merchant_repo.load_file('test_merchants.csv')
    assert_equal merchant_repo.merchant_repository.length, 13
  end
end

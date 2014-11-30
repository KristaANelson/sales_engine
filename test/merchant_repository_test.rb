require_relative 'test_helper'
require 'csv'
require 'merchant_repository'


class MerchantRepoTest < Minitest::Test

  def test_load_file_method_and_that_it_loads_rows
    merchant_repo = MerchantRepository.new
    merchant_repo.load_file('test_merchants.csv')
    assert_equal 13, merchant_repo.merchant_repository.length
  end

  def test_find_by_name_works
    merchant_repo = MerchantRepository.new([
      Merchant.new({:name => "Schroeder-Jerde"}, self),
      Merchant.new({:name => "Klein, Rempel and Jones"}, self),
      Merchant.new({:name => "Cummings-Thiel"}, self)
      ])
    assert_equal "Schroeder-Jerde", merchant_repo.find_by_name("Schroeder-Jerde").name

  end


  repo = TransactionRepository.new([
    Transaction.new({:credit_card_number => '4654405418249632'}, self),
    Transaction.new({:credit_card_number => '4654405418249631'}, self),
    Transaction.new({:credit_card_number => '4654405418249630'}, self)])
  assert_equal "4654405418249632", repo.find_by_credit_card_number("4654405418249632").credit_card_number
end

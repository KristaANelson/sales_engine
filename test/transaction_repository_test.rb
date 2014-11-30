require_relative 'test_helper'
require 'transaction_repository'
require 'sales_engine'
require 'csv'

class TransactionRepoTest < Minitest::Test

  def test_find_by_credit_card_number_does_not_suck
    repo = TransactionRepository.new([
      Transaction.new({:credit_card_number => '4654405418249632'}, self),
      Transaction.new({:credit_card_number => '4654405418249631'}, self),
      Transaction.new({:credit_card_number => '4654405418249630'}, self)])
    assert_equal "4654405418249632", repo.find_by_credit_card_number("4654405418249632").credit_card_number
  end

  


end

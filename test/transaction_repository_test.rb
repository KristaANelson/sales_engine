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

  def test_find_all_by_result_does_not_suck
    repo = TransactionRepository.new([
      Transaction.new({:result => "success"}, self),
      Transaction.new({:result => "success"}, self),
      Transaction.new({:result => "success"}, self),
      Transaction.new({:result => "success"}, self),
      Transaction.new({:result => "success"}, self),
      ])
    assert_equal 5, repo.find_all_by_result("success").size
  end

end

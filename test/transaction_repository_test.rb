require_relative 'test_helper'
require 'transaction_repository'
require 'csv'

class TransactionRepoTest < Minitest::Test
  def test_load_file_method_and_that_it_loads_rows
    transaction_repo = TransactionRepo.new
    transaction_repo.load_file('test_transactions.csv')
    assert_equal transaction_repo.transaction_repo.length, 10
  end



end

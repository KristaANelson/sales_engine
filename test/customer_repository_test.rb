require_relative 'test_helper'
require 'customer_repository'
require 'csv'

class CustomerRepoTest <Minitest::Test
  def test_load_file_method_and_that_it_loads_rows
    customer_repo = CustomerRepo.new
    customer_repo.load_file('test_customers.csv')
    assert_equal customer_repo.customer_repository.length, 10
  end
end

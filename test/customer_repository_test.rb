require_relative 'test_helper'
require 'customer_repository'
require 'csv'

class CustomerRepoTest <Minitest::Test
  def test_find_all_by_last_name
    repo = CustomerRepository.new([
      Customer.new(last_name: 'Smith'),
      Customer.new(last_name: 'Smith'),
      Customer.new(last_name: 'Cheek')
    ])
    assert_equal ['Cheek'], repo.find_all_by_last_name('Cheek')
    assert_equal ['Smith', 'Smith'], repo.find_all_by_last_name('Smith')
    assert_equal [], repo.find_all_by_last_name('O.o')
  end
end

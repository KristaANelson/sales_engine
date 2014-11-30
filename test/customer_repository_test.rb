require_relative 'test_helper'
require 'customer_repository'
require 'csv'

class CustomerRepoTest <Minitest::Test
  def test_find_all_by_last_name
    repo = CustomerRepository.new([
      Customer.new({:last_name => 'Smith'}, self),
      Customer.new({:last_name => 'Smith'}, self),
      Customer.new({:last_name => 'Cheek'}, self)
    ])
    assert_equal 'Cheek', repo.find_all_by_last_name('Cheek').first.last_name
    assert_equal 'Smith', repo.find_all_by_last_name('Smith')[1].last_name
    assert_equal 'Smith', repo.find_all_by_last_name('Smith')[0].last_name
    assert_equal [], repo.find_all_by_last_name('O.o')
  end
end

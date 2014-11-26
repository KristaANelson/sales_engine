require 'pry'
require 'csv'
require_relative 'customer'
require_relative 'generic_repository_helper'
require_relative 'customer_repository_helper'


class CustomerRepository
  include GenericRepositoryHelper
  include CustomerRepositoryHelper
  attr_reader :repository, :filename

  def initialize(customers)
    @repository = customers
  end

  def inspect
    "I am a customer repo, inspect was called."
  end

  def find_all_by_last_name(last_name)
    @repository.select { |customer| customer.last_name == last_name }
  end
end

# def test_find_all_by_last_name
#   repo = CustomerRepository.new([
#     Customer.new(last_name: 'Smith'),
#     Customer.new(last_name: 'Smith'),
#     Customer.new(last_name: 'Cheek')
#   ])
#   assert_equal ['Cheek'], repo.find_all_by_last_name('Cheek')
#   assert_equal ['Smith', 'Smith'], repo.find_all_by_last_name('Smith')
#   assert_equal [], repo.find_all_by_last_name('O.o')
# end

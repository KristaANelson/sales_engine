require_relative 'test_helper'
require 'customer_repository'
require 'csv'
require 'pry'

class CustomerRepoTest <Minitest::Test

  attr_reader :data,
              :parent,
              :customer_repository,
              :filepath

  def setup
    @filepath = File.expand_path('../../test_data',  __FILE__)
    @data = CSV.open("#{filepath}/test_customers.csv", headers: true, header_converters: :symbol)
    @parent = Minitest::Mock.new
    @customer_repository = CustomerRepository.new(parent, data)
  end


  def test_find_all_by_last_name
    assert_equal 4, customer_repository.find_all_by_last_name('Ondricka').count
    assert_equal 1, customer_repository.find_all_by_last_name('Nader').count
    assert_equal "Joey", customer_repository.find_all_by_last_name('Ondricka').first.first_name
    assert_equal [], customer_repository.find_all_by_last_name('Smith')
  end

end

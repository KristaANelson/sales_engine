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

  def test_find_all_by_first_name
    assert_equal 1, customer_repository.find_all_by_first_name('Cecelia').count
    assert_equal 2, customer_repository.find_all_by_first_name('Heber').count
    assert_equal 'Ondricka', customer_repository.find_all_by_first_name('Joey').first.last_name
    assert_equal [], customer_repository.find_all_by_first_name('Krista')
  end

  def test_find_by_last_name
    assert ['Joey','Marky-Mark','Ice-T','Joey'].include?(customer_repository.find_by_last_name('Ondricka').first_name)
    assert_equal 'Eileen', customer_repository.find_by_last_name('Gerlach').first_name
    assert_equal nil, customer_repository.find_by_last_name('Smith')
  end

  def test_find_by_first_name
    assert ['Baumbach','Kuhn'].include?(customer_repository.find_by_first_name('Heber').last_name)
    assert_equal 'Gerlach', customer_repository.find_by_first_name('Eileen').last_name
    assert_equal nil, customer_repository.find_by_first_name('Smith')
  end

  def test_find_invoices_using_goes_to_sales_engine
    parent.expect(:find_invoices_using_customer_id, nil, [5])
    customer_repository.find_invoices_using(5)
    parent.verify
  end

  def test_find_transactions_using_goes_to_sales_engine
    parent.expect(:find_transactions_using_customer_id, nil, [5])
    customer_repository.find_transactions_using_customer_id(5)
    parent.verify
  end

  def test_find_favorite_merchant_using_goes_to_sales_engine
    parent.expect(:find_favorite_merchant_using_customer_id, nil, [5])
    customer_repository.find_favorite_merchant_using_customer_id(5)
    parent.verify
  end
end

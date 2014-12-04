# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'csv'
require 'merchant_repository'


class MerchantRepoTest < Minitest::Test

  attr_reader :data,
              :parent,
              :merchant_repository,
              :filepath

  def setup
    @filepath = File.expand_path('../../test_data',  __FILE__)
    @data = CSV.open("#{filepath}/test_merchants.csv", headers: true, header_converters: :symbol)
    @parent = Minitest::Mock.new
    @merchant_repository = MerchantRepository.new(parent, data)
  end


  def test_find_all_by_name
    assert_equal 1, merchant_repository.find_all_by_name('Willms and Sons').count
    assert_equal [], merchant_repository.find_all_by_name('Smith Co')
  end


  def test_find_by_id
    assert_equal 'Willms and Sons', merchant_repository.find_by_id(3).name
    assert_equal nil, merchant_repository.find_by_id(54)
  end

  def test_find_by_name
    assert [3].include?(merchant_repository.find_by_name("Willms and Sons").id)
    assert_equal nil, merchant_repository.find_by_name('Smith CO')
  end

  def test_find_all_by_created_at_date
    assert_equal 13, merchant_repository.find_all_by_created_at(Date.parse('2012-03-27 14:53:59 UTC')).count
    assert_equal [], merchant_repository.find_all_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_by_created_at_date
    assert_equal Merchant, merchant_repository.find_by_created_at(Date.parse('2012-03-27 14:53:59 UTC')).class
    assert_equal nil, merchant_repository.find_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_all_by_updated_at_date
    assert_equal 13, merchant_repository.find_all_by_updated_at(Date.parse('2012-03-27 14:53:59 UTC')).count
    assert_equal [], merchant_repository.find_all_by_updated_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_by_updated_at_date
    assert_equal Merchant, merchant_repository.find_by_updated_at(Date.parse('2012-03-27 14:53:59 UTC')).class
    assert_equal nil, merchant_repository.find_by_updated_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_items_using_goes_to_sales_engine
    parent.expect(:find_items_using_merchant, nil, [1])
    merchant_repository.find_items_using(1)
    parent.verify
  end

  def test_find_customers_using_customer_id_goes_to_sales_engine
    parent.expect(:find_customers_using_customer_id, nil, [5])
    merchant_repository.find_customers_using_customer_id(5)
    parent.verify
  end
end

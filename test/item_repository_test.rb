# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'item_repository'
require 'csv'
require 'pry'

class ItemRepoTest <Minitest::Test
attr_reader :data,
            :parent,
            :item_repository,
            :filepath
  def setup
    @filepath = File.expand_path('../../test_data',  __FILE__)
    @data = CSV.open("#{filepath}/test_items.csv", headers: true, header_converters: :symbol)
    @parent = Minitest::Mock.new
    @item_repository = ItemRepository.new(parent, data)
  end

  def test_find_invoice_items_using_item_id_goes_to_sales_engine
    parent.expect(:find_invoice_items_using_item_id, nil, [1])
    item_repository.find_invoice_items_using_item_id(1)
    parent.verify
  end

  def test_find_merchant_using_merchant_id_goes_to_sales_engine
    parent.expect(:find_merchant_using_merchant_id, nil, [5])
    item_repository.find_merchant_using_merchant_id(5)
    parent.verify
  end

  def test_find_highest_revenue_date_using_item_goes_to_sales_engine
    parent.expect(:find_highest_revenue_date_using_item, nil, [5])
    item_repository.find_highest_revenue_date_using_item(5)
    parent.verify
  end

  def test_find_by_id_returns_1_item
    assert_equal 1, item_repository.find_by_id(1).merchant_id
  end

  def test_find_by_id_returns_item_item_object
    assert_equal Item, item_repository.find_by_id(1).class
  end

  def test_find_by_id_finds_correct_item_item
    assert_equal 1, item_repository.find_by_id(2).merchant_id
  end

  def test_find_by_id_returns_nil_if_no_such_id
    assert_equal  nil , item_repository.find_by_id(45)
  end

  def test_find_all_by_merchant_id_returns_collection_of_items
    assert_equal 1, item_repository.find_all_by_merchant_id(1)[0].id
    assert_equal 2, item_repository.find_all_by_merchant_id(1)[1].id
    assert_equal 10, item_repository.find_all_by_merchant_id(1).size
  end

  def test_find_all_by_description_returns_empty_array_if_no_customer_id_presnt
    assert_equal  [] , item_repository.find_all_by_description("description")
  end

  def test_find_all_by_merchant_id_returns_array_of_items
    assert_equal Item, item_repository.find_all_by_merchant_id(1)[0].class
  end

  def test_find_all_by_created_at_date
    assert_equal 10, item_repository.find_all_by_created_at(Date.parse('2012-03-27 14:53:59 UTC')).count
    assert_equal [], item_repository.find_all_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_by_created_at_date
    assert_equal Item, item_repository.find_by_created_at(Date.parse('2012-03-27 14:53:59 UTC')).class
    assert_equal nil, item_repository.find_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_all_by_updated_at_date
    assert_equal 10, item_repository.find_all_by_updated_at(Date.parse('2012-03-27 14:53:59 UTC')).count
    assert_equal [], item_repository.find_all_by_updated_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_by_updated_at_date
    assert_equal Item, item_repository.find_by_updated_at(Date.parse('2012-03-27 14:53:59 UTC')).class
    assert_equal nil, item_repository.find_by_updated_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end
end

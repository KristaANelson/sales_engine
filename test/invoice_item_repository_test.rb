# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'invoice_item_repository'
require 'csv'
require 'pry'
class InvoiceItemRepoTest < Minitest::Test

  attr_reader :data,
              :parent,
              :invoice_item_repository,
              :filepath
  def setup
    @filepath = File.expand_path('../../test_data',  __FILE__)
    @data = CSV.open("#{filepath}/test_invoice_items.csv", headers: true, header_converters: :symbol)
    @parent = Minitest::Mock.new
    @invoice_item_repository = InvoiceItemRepository.new(parent, data)
  end

  def test_def_find_item_using_goes_to_sales_engine
    parent.expect(:find_item_using_item_id, nil, [5])
    invoice_item_repository.find_item_using(5)
    parent.verify
  end

  def test_def_find_invoice_using_goes_to_sales_engine
    parent.expect(:find_invoice_using, nil, [5])
    invoice_item_repository.find_invoice_using(5)
    parent.verify
  end

  def test_new_invoice_item_id_creates_next_id
    assert_equal 11, invoice_item_repository.new_invoice_item_id
  end

  def test_find_by_item_id_returns_1_invoice_item
    assert [2, 3].include?(invoice_item_repository.find_by_item_id(528).id)
  end
  def test_find_by_item_id_returns_invoice_item_object
    assert_equal InvoiceItem, invoice_item_repository.find_by_item_id(528).class
  end

  def test_find_by_item_id_finds_correct_invoice_item
    assert_equal 1, invoice_item_repository.find_by_item_id(539).id
  end

  def test_find_by_item_id_returns_nil_if_no_such_item_id
    assert_equal  nil , invoice_item_repository.find_by_item_id(4567)
  end

  def test_find_all_by_item_id_returns_collection_of_items
    assert_equal 2, invoice_item_repository.find_all_by_item_id(528)[0].id
    assert_equal 3, invoice_item_repository.find_all_by_item_id(528)[1].id
    assert_equal 2, invoice_item_repository.find_all_by_item_id(528).size
  end

  def test_find_all_by_item_id_returns_empty_array_if_no_item_id_presnt
    assert_equal  [] , invoice_item_repository.find_all_by_item_id(456)
  end

  def test_find_all_by_item_id_returns_array_of_invoice_items
    assert_equal InvoiceItem, invoice_item_repository.find_all_by_item_id(528)[0].class
  end

  def test_find_by_invoice_id_returns_invoice_item
    assert_equal InvoiceItem, invoice_item_repository.find_by_invoice_id(1).class
  end

  def test_find_by_invoice_id_returns_1_invoice_item
    assert [8, 9].include?(invoice_item_repository.find_by_invoice_id(2).id)
  end

  def test_find_by_invoice_id_returns_nil_if_no_such_item
    assert_equal  nil  , invoice_item_repository.find_by_invoice_id(4567)
  end

  def test_find_all_by_invoice_id_returns_collection
    assert_equal 7, invoice_item_repository.find_all_by_invoice_id(1).count
  end

  def test_find_all_by_invoice_id_returns_collection_invoice_items
    assert_equal InvoiceItem, invoice_item_repository.find_all_by_invoice_id(1)[0].class
  end

  def test_find_all_by_invoice_id_returns_empty_array_for_no_invoice_ids_present
      assert_equal  []  , invoice_item_repository.find_all_by_invoice_id(4567)
  end

  def test_find_by_quantity_returns_single_invoice_item
    assert [1,6].include?(invoice_item_repository.find_by_quantity(5).id)
    assert_equal InvoiceItem, invoice_item_repository.find_by_quantity(5).class
  end

  def test_find_by_quantity_returns_nil_for_no_such_quantity
    assert_equal nil, invoice_item_repository.find_by_quantity(73983)
  end

  def test_find_all_by_quantity_returns_collection
    assert_equal 1, invoice_item_repository.find_all_by_quantity(5)[0].id
    assert_equal 6, invoice_item_repository.find_all_by_quantity(5)[1].id
    assert_equal 2, invoice_item_repository.find_all_by_quantity(5).size
  end

  def test_find_all_by_quantity_returns_empty_array_for_no_quantity
    assert_equal  []  , invoice_item_repository.find_all_by_quantity(100)
  end

  def test_find_all_by_quanity_returns_array_of_InvoiceItems
    assert_equal InvoiceItem, invoice_item_repository.find_all_by_quantity(5)[0].class
  end

  def test_find_by_unit_price
    assert_equal 2, invoice_item_repository.find_by_unit_price(BigDecimal('233.24')).id
    assert_equal InvoiceItem, invoice_item_repository.find_by_unit_price(BigDecimal('233.24')).class
    assert_equal  nil  , invoice_item_repository.find_by_unit_price(1000)
  end

  def test_find_all_by_unit_price
    assert_equal 2, invoice_item_repository.find_all_by_unit_price(BigDecimal('233.24'))[0].id
    assert_equal 1, invoice_item_repository.find_all_by_unit_price(BigDecimal('233.24')).count
    assert_equal [], invoice_item_repository.find_all_by_unit_price(BigDecimal('23389.24'))
  end

  def test_find_all_by_created_at_date
    assert_equal 10, invoice_item_repository.find_all_by_created_at(Date.parse('2012-03-27 14:54:09 UTC')).count
    assert_equal [], invoice_item_repository.find_all_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_by_created_at_date
    assert_equal InvoiceItem, invoice_item_repository.find_by_created_at(Date.parse('2012-03-27 14:54:09 UTC')).class
    assert_equal nil, invoice_item_repository.find_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end
end

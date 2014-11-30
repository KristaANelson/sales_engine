require_relative 'test_helper'
require 'invoice_item_repository'
require 'csv'
require 'pry'
class InvoiceItemRepoTest < Minitest::Test
  def test_find_by_item_id
    repo = InvoiceItemRepository.new([
    InvoiceItem.new({:id => '1', :item_id => '123'}, self),
    InvoiceItem.new({:id => '2', :item_id => '123'}, self),
    InvoiceItem.new({:id => '3', :item_id => '234'}, self)
    ])
    assert ['1','2'].include?(repo.find_by_item_id('123').id)
    assert_equal InvoiceItem, repo.find_by_item_id('123').class
    assert_equal '234', repo.find_by_item_id('234').item_id
    assert_equal  nil , repo.find_by_item_id('456')
  end
  def test_find_all_by_item_id
    repo = InvoiceItemRepository.new([
    InvoiceItem.new({:item_id => '123'}, self),
    InvoiceItem.new({:item_id => '123'}, self),
    InvoiceItem.new({:item_id => '234'}, self)
    ])
    assert_equal '123', repo.find_all_by_item_id('123')[0].item_id
    assert_equal '123', repo.find_all_by_item_id('123')[1].item_id
    assert_equal 2, repo.find_all_by_item_id('123').size
    assert_equal '234', repo.find_all_by_item_id('234')[0].item_id
    assert_equal 1, repo.find_all_by_item_id('234').size
    assert_equal  0 , repo.find_all_by_item_id('456').size
  end
  def test_find_by_invoice_id
    repo = InvoiceItemRepository.new([
      InvoiceItem.new({:id => '1', :invoice_id => '1234'}, self),
      InvoiceItem.new({:id => '2', :invoice_id => '1234'}, self),
      InvoiceItem.new({:id => '3', :invoice_id => '2345'}, self)
      ])
    assert ['1','2'].include?(repo.find_by_invoice_id('1234').id)
    assert_equal InvoiceItem, repo.find_by_invoice_id('1234').class
    assert_equal '2345', repo.find_by_invoice_id('2345').invoice_id
    assert_equal  nil  , repo.find_by_invoice_id('4567')
  end

  def test_find_all_by_invoice_id
    repo = InvoiceItemRepository.new([
      InvoiceItem.new({:invoice_id => '1234'}, self),
      InvoiceItem.new({:invoice_id => '1234'}, self),
      InvoiceItem.new({:invoice_id => '2345'}, self)
      ])
    assert_equal '1234', repo.find_all_by_invoice_id('1234')[0].invoice_id
    assert_equal '1234', repo.find_all_by_invoice_id('1234')[1].invoice_id
    assert_equal '2345', repo.find_all_by_invoice_id('2345')[0].invoice_id
    assert_equal  []  , repo.find_all_by_invoice_id('4567')
  end
  def test_find_by_quantity
    repo = InvoiceItemRepository.new([
      InvoiceItem.new({:id => '1', :quantity => '1'}, self),
      InvoiceItem.new({:id => '2', :quantity => '1'}, self),
      InvoiceItem.new({:id => '3', :quantity => '5'}, self)
      ])
    assert ['1','2'].include?(repo.find_by_quantity('1').id)
    assert_equal InvoiceItem, repo.find_by_quantity('1').class
    assert_equal '5', repo.find_by_quantity('5').quantity
    assert_equal  nil  , repo.find_by_quantity('10')
  end

  def test_find_all_by_quantity
    repo = InvoiceItemRepository.new([
      InvoiceItem.new({:quantity => '1'}, self),
      InvoiceItem.new({:quantity => '1'}, self),
      InvoiceItem.new({:quantity => '5'}, self)
      ])
    assert_equal '1', repo.find_all_by_quantity('1')[0].quantity
    assert_equal '1', repo.find_all_by_quantity('1')[1].quantity
    assert_equal '5', repo.find_all_by_quantity('5')[0].quantity
    assert_equal  []  , repo.find_all_by_quantity('10')
  end
  def test_find_by_unit_price
    repo = InvoiceItemRepository.new([
      InvoiceItem.new({:id => '1', :unit_price => '100'}, self),
      InvoiceItem.new({:id => '2', :unit_price => '100'}, self),
      InvoiceItem.new({:id => '3', :unit_price => '500'}, self)
      ])
    assert ['1','2'].include?(repo.find_by_unit_price('100').id)
    assert_equal InvoiceItem, repo.find_by_unit_price('100').class
    assert_equal '500', repo.find_by_unit_price('500').unit_price
    assert_equal  nil  , repo.find_by_unit_price('1000')
  end

  def test_find_all_by_unit_price
    repo = InvoiceItemRepository.new([
      InvoiceItem.new({:unit_price => '100'}, self),
      InvoiceItem.new({:unit_price => '100'}, self),
      InvoiceItem.new({:unit_price => '500'}, self)
      ])
    assert_equal '100', repo.find_all_by_unit_price('100')[0].unit_price
    assert_equal '100', repo.find_all_by_unit_price('100')[1].unit_price
    assert_equal '500', repo.find_all_by_unit_price('500')[0].unit_price
    assert_equal  []  , repo.find_all_by_unit_price('1000')
  end
end

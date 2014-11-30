require_relative 'test_helper'
require 'item_repository'
require 'csv'
require 'pry'

class ItemRepoTest <Minitest::Test
  def test_find_all_by_name
    repo = ItemRepository.new([
    Item.new({:name => 'Item Qui Esse'}, self),
    Item.new({:name => 'Item Qui Esse'}, self),
    Item.new({:name => 'Item Autem Minima'}, self)
    ])
    assert_equal 'Item Qui Esse', repo.find_all_by_name('Item Qui Esse')[0].name
    assert_equal 'Item Qui Esse', repo.find_all_by_name('Item Qui Esse')[1].name
    assert_equal 'Item Autem Minima', repo.find_all_by_name('Item Autem Minima')[0].name
    assert_equal  [] , repo.find_all_by_name('Item Qui Minima')
  end

  def test_find_all_by_unit_price
    repo = ItemRepository.new([
      Item.new({:unit_price => '75107'}, self),
      Item.new({:unit_price => '75107'}, self),
      Item.new({:unit_price => '67076'}, self)
      ])
    assert_equal '75107', repo.find_all_by_unit_price('75107')[0].unit_price
    assert_equal '75107', repo.find_all_by_unit_price('75107')[1].unit_price
    assert_equal '67076', repo.find_all_by_unit_price('67076')[0].unit_price
    assert_equal  []  , repo.find_all_by_unit_price('456213')
  end

  def test_find_all_by_merchant_id
    repo = ItemRepository.new([
      Item.new({:merchant_id => '1'}, self),
      Item.new({:merchant_id => '1'}, self),
      Item.new({:merchant_id => '2'}, self)
      ])
    assert_equal '1', repo.find_all_by_merchant_id('1')[0].merchant_id
    assert_equal '1', repo.find_all_by_merchant_id('1')[1].merchant_id
    assert_equal '2', repo.find_all_by_merchant_id('2')[0].merchant_id
    assert_equal  []  , repo.find_all_by_merchant_id('3')
  end
end

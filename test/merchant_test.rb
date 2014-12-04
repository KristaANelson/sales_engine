# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'merchant'
require 'pry'

class MerchantTest < Minitest::Test
  attr_reader :merchant,
              :parent

  def setup
    row ={
            id: "1",
            name:	"JoeyBiz",
            created_at:	"2012-03-27 14:54:09 UTC",
            updated_at:	"2012-03-27 14:54:09 UTC"
          }
    @parent = Minitest::Mock.new
    @merchant = Merchant.new(row, parent)
  end

  def test_merchant_class_has_id_attribute
    assert_equal 1, merchant.id
  end

  def test_merchant_class_has_name_attribute
    assert_equal "JoeyBiz", merchant.name
  end


  def test_merchant_class_has_created_at
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), merchant.created_at
  end

  def test_merchant_class_has_updated_at
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), merchant.updated_at
  end

  def test_it_delegates_items_method_to_its_parent
    parent.expect(:find_items_using, nil, [1])
    merchant.items
    parent.verify
  end

  def test_it_delegates_invoices_method_to_its_parent
    parent.expect(:find_invoices_using, nil, [1])
    merchant.invoices
    parent.verify
  end

  def test_it_delegates_find_customers_using_customer_id_to_its_parent
    parent.expect(:find_customers_using_customer_id, nil, [1])
    merchant.find_customers_using_customer_id(1)
    parent.verify
  end
end

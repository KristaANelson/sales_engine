require_relative 'test_helper'
require 'customer'
require 'customer_repository'

class CustomerTest < Minitest::Test
  attr_reader :customer,
              :parent

  def setup
    row ={
            id: "1",
            first_name:	"Joey",
            last_name:	"Ondricka",
            created_at:	"2012-03-27 14:54:09 UTC",
            updated_at:	"2012-03-27 14:54:09 UTC"
          }
    @parent = Minitest::Mock.new
    @customer = Customer.new(row, parent)
  end

  def test_customer_class_has_id_attribute
    assert_equal 1, customer.id
  end

  def test_customer_class_has_first_name_attribute
    assert_equal "Joey", customer.first_name
  end

  def test_customer_class_has_last_name_attribute
    assert_equal "Ondricka", customer.last_name
  end

  def test_customer_class_has_created_at
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), customer.created_at
  end

  def test_customer_class_has_updated_at
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), customer.updated_at
  end

  def test_it_delegates_invoices_method_to_its_parent
    parent.expect(:find_invoices_using, nil, [1])
    customer.invoices
    parent.verify
  end

  def test_it_delegates_transaction_method_to_its_parent
    parent.expect(:find_transactions_using_customer_id, nil, [1])
    customer.transactions
    parent.verify
  end

  def test_it_delegates_favorite_merchant_method_to_its_parent
    parent.expect(:find_favorite_merchant_using_customer_id, nil, [1])
    customer.favorite_merchant
    parent.verify
  end
end

require_relative 'test_helper'
require 'customer'

class CustomerTest < Minitest::Test
  def test_customer_class_has_id_attribute
    row = { id: "1",
            first_name:	"Joey",
            last_name:	"Ondricka",
            created_at:	"2012-03-27 14:54:09 UTC",
            updated_at:	"2012-03-27 14:54:09 UTC"
            }
    customer = Customer.new(row)

    assert_equal "1", customer.id
  end

  def test_customer_class_has_first_name_attribute
    row = { id: "1",
           first_name:	"Joey",
           last_name:	"Ondricka",
           created_at:	"2012-03-27 14:54:09 UTC",
           updated_at:	"2012-03-27 14:54:09 UTC"
           }
    customer = Customer.new(row)
    assert_equal "joey", customer.first_name
  end

  def test_customer_class_has_last_name_attribute
    row = { id: "1",
           first_name:	"Joey",
           last_name:	"Ondricka",
           created_at:	"2012-03-27 14:54:09 UTC",
           updated_at:	"2012-03-27 14:54:09 UTC"
           }
    customer = Customer.new(row)
    assert_equal "ondricka", customer.last_name
  end

  def test_customer_class_has_created_at
    row = { id: "1",
           first_name:	"Joey",
           last_name:	"Ondricka",
           created_at:	"2012-03-27 14:54:09 UTC",
           updated_at:	"2012-03-27 14:54:09 UTC"
           }
    customer = Customer.new(row)
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
  end

  def test_customer_class_has_updated_at
    row = { id: "1",
           first_name:	"Joey",
           last_name:	"Ondricka",
           created_at:	"2012-03-27 14:54:09 UTC",
           updated_at:	"2012-03-27 14:54:09 UTC"
           }
    customer = Customer.new(row)
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end

end

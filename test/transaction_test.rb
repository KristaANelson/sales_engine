# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'transaction'
require 'pry'

class TransactionTest < Minitest::Test
  attr_reader :transaction,
              :parent

  def setup
    row ={
          id: "1",
          invoice_id: '1',
          credit_card_number:  "4654405418249632",
          credit_card_expiration_date: "12/2/12",
          result: "success",
          created_at:	"2012-03-27 14:54:09 UTC",
          updated_at:	"2012-03-27 14:54:09 UTC"
          }
    @parent = Minitest::Mock.new
    @transaction = Transaction.new(row, parent)
  end

  def test_transaction_class_has_id_attribute
    assert_equal 1, transaction.id
  end

  def test_transaction_class_has_invoice_id_attribute
    assert_equal 1, transaction.invoice_id
  end


  def test_transaction_class_has_cc
    assert_equal "4654405418249632", transaction.credit_card_number
  end

  def test_transaction_class_has_cc_exp
    assert_equal "12/2/12", transaction.credit_card_expiration_date
  end

  def test_transaction_class_has_result
    assert_equal "success", transaction.result
  end

  def test_transaction_class_has_createt_at
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), transaction.created_at
  end
  def test_transaction_class_has_updated_at
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), transaction.updated_at
  end

  def test_it_delegates_invoice_method_to_its_parent
    parent.expect(:find_invoices_using, nil, [1])
    transaction.invoice
    parent.verify
  end

  def test_it_delegates_invoices_method_to_its_parent
    assert transaction.success?
  end
end

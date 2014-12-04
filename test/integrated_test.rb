require_relative 'test_helper'
require 'customer_repository'
require "merchant_repository"
require "invoice_repository"
require "invoice_item_repository"
require "transaction_repository"
require "item_repository"
require "sales_engine"
require "invoice_item_repository_helper"
require "invoice_item_repository"
require "generic_repository_helper"
require 'bigdecimal'


class IntegratedTest < Minitest::Test

  attr_reader :filepath, :parent, :invoice, :sales_engine, :customer_data, :invoice_data, :invoice_row, :item_repository, :invoice_repository, :invoice_repo_mock

  def setup
    @filepath               = File.expand_path('../../test_data',  __FILE__)
    # @parent               = Minitest::Mock.new
    # @item_repository      = Minitest::Mock.new
    @invoice_repository     = Minitest::Mock.new
    @invoice_row            = {
                              id: "1",
                              customer_id: "1",
                              merchant_id: "26",
                              status: "shipped",
                              created_at: "2012-03-25 09:54:09 UTC",
                              updated_at: "2012-03-25 09:54:09 UTC"
                              }
    @sales_engine           = SalesEngine.new(filepath)
    sales_engine.startup
    # @customer_data        = CSV.open("#{filepath}/test_customers.csv", headers: true, header_converters: :symbol)
    # @invoice_data         = CSV.open("#{filepath}/test_invoices.csv", headers: true, header_converters: :symbol)
    # # @invoice_repository = InvoiceRepository.new(parent, invoice_data)
    # @customer_repository  = CustomerRepository.new(parent, customer_data)
  end

  #some mock tests

  def test_invoice_class_delgates_items_method_to_invoice_repository
    parent                 = Minitest::Mock.new
    invoice                = Invoice.new(invoice_row, parent)
    parent.expect(:find_items_using_id, nil, [1])
    invoice.items
    parent.verify
  end

  def test_sales_engine_delegates_find_invoices_using_customer_method_to_invoice_repository
    invoice_repository.expect(:find_all_by_customer_id, [], [1])
    sales_engine.find_invoices_using_customer_id(1)
    invoice_repository.verify
  end

  #tests for functions that traverse classes

  def test_sales_engine_find_invoices_using_customer_id_works
    assert_equal 8, sales_engine.find_invoices_using_customer_id(1).count
  end

  def test_sales_engine_find_item_using_item_id_works
    assert_equal "Item Qui Esse", sales_engine.find_item_using_item_id(1).name
    assert_equal "Item Autem Minima", sales_engine.find_item_using_item_id(2).name
  end

  def test_sales_engine_find_invoice_using_invoice_id_works
    assert_equal 75, sales_engine.find_invoice_using(2).merchant_id
    assert_equal 78, sales_engine.find_invoice_using(3).merchant_id
  end

  def test_invoice_method_customer_finds_correct_customer
    #I have to substitute for parent because self refers to the test.
    invoice                = Invoice.new(invoice_row, sales_engine.invoice_repository)
    assert_equal "Joey", invoice.customer.first_name
    assert_equal "Ondricka", invoice.customer.last_name
  end

  def test_find_transcations_using_invoice_id
    assert_equal "4354495077693036", sales_engine.find_transcations_using_invoice(4).first.credit_card_number
  end


  def test_find_items_using_merchant_id_works
    assert_equal 10, sales_engine.find_items_using_merchant(1).count
    assert_equal 0, sales_engine.find_items_using_merchant(3).count
    assert_equal [], sales_engine.find_items_using_merchant(100)
  end

  def test_find_invoices_using_merchant_id_works
    assert_equal 1, sales_engine.find_invoices_using_merchant(26).count
    assert_equal 0, sales_engine.find_invoices_using_merchant(0).count
    assert_equal 1, sales_engine.find_invoices_using_merchant(75).count
    assert_equal [], sales_engine.find_invoices_using_merchant(1)

  end

  def test_find_merchant_using_merchant_id_works
    assert_equal "Schroeder-Jerde", sales_engine.find_merchant_using_merchant_id(1).name
    assert_equal "Osinski, Pollich and Koelpin", sales_engine.find_merchant_using_merchant_id(8).name
    refute sales_engine.find_merchant_using_merchant_id(100)
  end

  def test_find_transactions_using_customer_id_works
    assert_equal 8, sales_engine.find_transactions_using_customer_id(1).count
  end

  def test_create_transaction_works_and_adds_one_to_transactions_test_data
    sales_engine.startup
    transaction_data = {:credit_card_number => "4147097056000009", :credit_card_expiration_date => "4/17/2014", :result => "success"}
    sales_engine.create_transaction(transaction_data, 1)
    assert_equal 11, sales_engine.transaction_repository.repository.count
  end

  def test_sales_engine_find_favorite_merchant_using_customer_id
    assert_equal "Adams-Kovacek", sales_engine.find_favorite_merchant_using_customer_id(1).name
  end

  def test_find_items_using_invoice_id_works
    assert_equal "Item Quidem Suscipit", sales_engine.find_items_using_invoice(2)[1].name
    assert_equal [], sales_engine.find_items_using_invoice(3)
  end

end

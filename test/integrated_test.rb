require_relative 'test_helper'
require 'customer_repository'
require "merchant_repository"
require "invoice_repository"
require "invoice_item_repository"
require "transaction_repository"
require "item_repository"
require 'bigdecimal'

class IntegratedTest < Minitest::Test

  attr_reader :customer_data, :invoice, :filepath, :parent, :invoice_data, :invoice_row, :item_repository

  def setup
    @filepath = File.expand_path('../../test_data',  __FILE__)
    @customer_data = CSV.open("#{filepath}/test_customers.csv", headers: true, header_converters: :symbol)
    @invoice_data = CSV.open("#{filepath}/test_invoices.csv", headers: true, header_converters: :symbol)

    @parent = Minitest::Mock.new
    invoice_row = {
                    id: "1",
                    customer_id:"1",
                    merchant_id:"26",
                    status: "shipped",
                    created_at: "2012-03-25 09:54:09 UTC",
                    updated_at: "2012-03-25 09:54:09 UTC"
                  }
    @item_repository = Minitest::Mock.new
    @invoice = Invoice.new(invoice_row, parent)
    @customer_repository = CustomerRepository.new(parent, customer_data)
  end

  # def test_that_transaction_repository_holds_credit_card_info
  #   filepath = File.expand_path('../../data', __FILE__)
  #   engine = SalesEngine.new(filepath)
  #   engine.startup
  #   assert_equal "4654405418249632", engine.transaction_repository.repository.first.credit_card_number
  # end


  def test_invoice_class_delgates_items_method_to_invoice_repository
    item_repository.expect(:find_by_id, nil, [1])
    invoice.items
    item_repository.verify
  end
end

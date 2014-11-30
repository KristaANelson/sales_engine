require_relative 'test_helper'

require 'pry'
require "merchant_repository"
require "customer_repository"
require "invoice_repository"
require "invoice_item_repository"
require "transaction_repository"
require "item_repository"
require "sales_engine"

class SalesEngineTest < Minitest::Test
  def test_sales_engine_startup_method_loads_all_repositories
    filepath = File.expand_path('../../data', __FILE__)
    engine = SalesEngine.new(filepath)
    engine.startup
    assert engine.merchant_repository
    assert engine.invoice_repository
    assert engine.customer_repository
    assert engine.item_repository
    assert engine.invoice_item_repository
    assert engine.transaction_repository
  end

  def test_load_csv_data_method_loads_objects
    # merchant_repo = MerchantRepository.new
    # merchant_repo.load_file('test_merchants.csv')
    filepath = File.expand_path('../../test_data', __FILE__)
    engine = SalesEngine.new(filepath)
    file = engine.load_csv_data(filepath, 'test_merchants.csv', Merchant)
    assert_equal 13, file.size
  end
end

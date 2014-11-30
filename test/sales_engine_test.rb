require_relative 'test_helper'

require "merchant_repository"
require "customer_repository"
require "invoice_repository"
require "invoice_item_repository"
require "transaction_repository"
require "item_repository"
require "sales_engine"

class SalesEngineTest < Minitest::Test
  def test_sales_engine_startup_method_loads_all_repositories
    filepath = File.expand_path('../../data', __FILE__)     #my test helper isn't working
    engine = SalesEngine.new(filepath)
    engine.startup
    assert engine.merchant_repository
    assert engine.invoice_repository
    assert engine.customer_repository
    assert engine.item_repository
    assert engine.invoice_item_repository
    assert engine.transaction_repository
  end
end

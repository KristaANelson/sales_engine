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


  def test_right_filepath_is_loaded
    filepath = File.expand_path('../../test_data', __FILE__)
    engine = SalesEngine.new(filepath)
    assert_equal "/Users/Jwan/Dropbox/Turing/projects/sales_engine/test_data", engine.filepath
  end

  def test_can_load_different_filepath
    filepath = File.expand_path('../../data', __FILE__)
    engine = SalesEngine.new(filepath)
    assert_equal "/Users/Jwan/Dropbox/Turing/projects/sales_engine/data", engine.filepath
  end

  def test_sales_engine_startup_method_loads_all_repositories
    filepath = File.expand_path('../../test_data', __FILE__)
    engine = SalesEngine.new(filepath)
    engine.startup
    assert engine.merchant_repository
    assert engine.invoice_repository
    assert engine.customer_repository
    assert engine.item_repository
    assert engine.invoice_item_repository
    assert engine.transaction_repository
  end

  def test_sales_engine_startup_method_loads_whole_file
    filepath = File.expand_path('../../test_data', __FILE__)
    engine = SalesEngine.new(filepath)
    engine.startup
    assert_equal 10, engine.transaction_repository.repository.count
    assert_equal 23, engine.customer_repository.repository.count
    assert_equal 10, engine.item_repository.repository.count
  end

end

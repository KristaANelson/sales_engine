gem 'minitest'
require



require "csv"                               # => true
require_relative "merchant"                 # => true
require_relative "merchant_repository"      # => true
require_relative "customer"                 # => true
require_relative "customer_repository"      # => true
require_relative "invoice"                  # => true
require_relative "invoice_repository"       # => true
require_relative "invoice_item"             # => true
require_relative "invoice_item_repository"  # => true
require_relative "transaction"              # => true
require_relative "transaction_repository"   # => true
require_relative "item"                     # => true
require_relative "item_repository"          # => true




def test_sales_engine_startup_method_loads_all_repositories
  engine = SalesEngine.new(filepath)
  engine.startup
  assert merchant_repostory
  assert invoice_repository
  assert customer_repository
  assert item_repository
  assert invoice_item_repository
  assert transaction_repository
end

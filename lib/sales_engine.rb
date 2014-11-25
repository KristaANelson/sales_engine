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

class SalesEngine

  attr_reader :merchant_repository, :invoice_repository, :item_repository, :invoice_item_repository, :customer_repository, :transaction_repository  # => nil

  CSV_FILES = {:csv_file => "../sales_engine/data/customers.csv"}  # => {:csv_file=>"./data/customers.csv"}

  def initialize(filepath)
    @merchant_repository = MerchantRepository.new
    @invoice_repository = InvoiceRepository.new
    @item_repostiory    = ItemRepository.new
    @invoice_item_repository = InvoiceItemRepository.new
    @customer_repository = CustomerRepository.new
    @transaction_repository = TransactionRepository.new
  end

  def startup
    customer_repository.load_file(CSV_FILES[:csv_file])
  end
end

require "csv"
require_relative "merchant"
require_relative "merchant_repository"
require_relative "customer"
require_relative "customer_repository"
require_relative "invoice"
require_relative "invoice_repository"
require_relative "invoice_item"
require_relative "invoice_item_repository"
require_relative "transaction"
require_relative "transaction_repository"
require_relative "item"
require_relative "item_repository"

class SalesEngine

  attr_reader :merchant_repository, :invoice_repository, :item_repository, :invoice_item_repository, :customer_repository, :transaction_repository

  CSV_FILES = {:csv_file => "../sales_engine/data/customers.csv"}  #so this probably should not be here. Sales engine should not know what csv files we're using.

  def initialize(filepath)
    @merchant_repository = MerchantRepository.new
    @invoice_repository = InvoiceRepository.new
    @item_repository    = ItemRepository.new
    @invoice_item_repository = InvoiceItemRepository.new
    @customer_repository = CustomerRepository.new
    @transaction_repository = TransactionRepository.new
  end

  def startup
    # customer_repository.process     #maybe we should have this code instead.
    customer_repository.load_file(CSV_FILES[:csv_file], Customer)    #romeeka has a problem with this. SalesEngine now knows about customer and csvs. Should it?

  end
end

lib_dir = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_dir)
puts __dir__
data_dir = File.expand_path('../data', __dir__)
$LOAD_PATH.unshift(data_dir)

require 'pry'
require "csv"
require_relative "merchant_repository"
require_relative "customer_repository"
require_relative "invoice_repository"
require_relative "invoice_item_repository"
require_relative "transaction_repository"
require_relative "item_repository"
require 'bigdecimal'

class SalesEngine

  attr_reader :merchant_repository,
              :invoice_repository,
              :item_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository,
              :filepath

  def initialize(filepath)    #represents a directory so I can pass in 'merchants.csv' into the suffix of filepath.
    @filepath = filepath
    @merchant_repository     = MerchantRepository.new(self)
    @invoice_repository      = InvoiceRepository.new(self)
    @item_repository         = ItemRepository.new(self)
    @invoice_item_repository = InvoiceItemRepository.new(self)
    @customer_repository     = CustomerRepository.new(self)
    @transaction_repository  = TransactionRepository.new(self)
  end

  def startup
    merchant_repository.loader(filepath)
    invoice_repository.loader(filepath)
    item_repository.loader(filepath)
    invoice_item_repository.loader(filepath)
    customer_repository.loader(filepath)
    transaction_repository.loader(filepath)
  end

  def find_invoices_using_customer_id(id)
    invoice_repository.find_all_by_customer_id(id)
  end

  def find_item_using_item_id(item_id)
    item_repository.find_by_id(item_id)
  end

  def find_invoice_using(invoice_id)
    invoice_repository.find_by_id(invoice_id)
  end

  def find_transcations_using_invoice(id)
    transaction_repository.find_all_by_invoice_id(id)
  end

  def find_items_using_invoice(id)
    invoice_item_objects = invoice_item_repository.find_all_by_invoice_id(id)
    item_ids = invoice_item_objects.map {|invoice_item| invoice_item.item_id}
    item_ids.map {|item_id| item_repository.find_all_by_id(item_id)}
  end
end

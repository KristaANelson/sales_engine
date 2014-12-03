lib_dir = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_dir)
data_dir = File.expand_path('../data', __dir__)
$LOAD_PATH.unshift(data_dir)

require 'pry'
require "csv"
require "merchant_repository"
require "customer_repository"
require "invoice_repository"
require "invoice_item_repository"
require "transaction_repository"
require "item_repository"
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
    @merchant_repository     ||= MerchantRepository.new(self)
    @invoice_repository      ||= InvoiceRepository.new(self)
    @item_repository         ||= ItemRepository.new(self)
    @invoice_item_repository ||= InvoiceItemRepository.new(self)
    @customer_repository     ||= CustomerRepository.new(self)
    @transaction_repository  ||= TransactionRepository.new(self)
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
    item_ids.map {|item_id| item_repository.find_by_id(item_id)}
  end

  def find_customer_using_customer_id(customer_id)
    customer_repository.find_by_id(customer_id)
  end

  def find_invoice_items_using_invoice_id(id)
    invoice_item_repository.find_all_by_invoice_id(id)
  end

  def find_invoice_items_using_item_id(id)
    invoice_item_repository.find_all_by_item_id(id)
  end

  def find_merchant_using_merchant_id(merchant_id)
    merchant_repository.find_by_id(merchant_id)
  end

  def find_invoices_using_invoice_id(invoice_id)
    # invoice_objects =
    invoice_repository.find_by_id(invoice_id)
    # customer_ids = invoice_objects.map {|invoice_object| invoice_object.customer_id}
    # customer_ids.map {|customer_id| customer_repository.find_all_by_id(customer_id)}
  end

  def find_customers_using_customer_id(customer_id)
    customer_repository.find_by_id(customer_id)
  end

  def find_items_using_merchant(id)
    item_repository.find_all_by_merchant_id(id)
  end

  def find_invoices_using_merchant(id)
    invoice_repository.find_all_by_merchant_id(id)
  end

  def find_transactions_using_customer_id(id)
    invoice_objects = invoice_repository.find_all_by_customer_id(id)
    invoice_ids = invoice_objects.map {|invoice| invoice.id}
    invoice_ids.map {|invoice_id| transaction_repository.find_all_by_invoice_id(invoice_id)}
  end

  def find_favorite_merchant_using_customer_id(id)
    invoice_objects = invoice_repository.find_all_by_customer_id(id)
    merchant_ids = invoice_objects.map {|invoice| invoice.merchant_id}
    merchant_repository.find_by_id(favorite_merchant_id(merchant_ids))
  end

  def favorite_merchant_id(merchant_ids)
    freq_hash = merchant_ids.inject(Hash.new(0)) do |hash, merchant_id|
      hash[merchant_id] +=1
      hash
    end
    merchant_ids.max_by {|merchant_id| freq_hash[merchant_id]}
  end

  def create_invoice(customer, merchant, status, items)
    new_invoice = invoice_repository.add(customer, merchant)
    invoice_item_repository.add(new_invoice, items)
  end

  def create_invoice_items(items, new_invoice_id)
    invoice_item_repository.create_invoice_items(items, new_invoice_id)
  end

  def create_transaction(transaction_data, id)
    transaction_repository.create_transaction(transaction_data, id)
  end

  def returns_revenue_for_all_merchants_on_specific_date(merchant_repository_ids, date)
    invoice_repository.returns_revenue_for_all_merchants_on_specific_date(merchant_repository_ids, date)
  end
end

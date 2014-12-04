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

  attr_accessor :merchant_repository,
                :invoice_repository,
                :item_repository,
                :invoice_item_repository,
                :customer_repository,
                :transaction_repository,
                :filepath

  def initialize(filepath)
    @filepath = filepath
  end

  def startup
    @merchant_repository     ||= MerchantRepository.new(self, merchant_data)
    @invoice_repository      ||= InvoiceRepository.new(self, invoice_data)
    @item_repository         ||= ItemRepository.new(self, item_data)
    @invoice_item_repository ||= InvoiceItemRepository.new(self, inv_item_data)
    @customer_repository     ||= CustomerRepository.new(self, customer_data)
    @transaction_repository  ||= TransactionRepository.new(self, trans_data)
  end

  def merchant_data
    CSV.open("#{filepath}/merchants.csv",
    headers: true, header_converters: :symbol)
  end

  def invoice_data
    CSV.open("#{filepath}/invoices.csv",
    headers: true, header_converters: :symbol)
  end

  def item_data
    CSV.open("#{filepath}/items.csv",
    headers: true, header_converters: :symbol)
  end

  def inv_item_data
    CSV.open("#{filepath}/invoice_items.csv",
    headers: true, header_converters: :symbol)
  end

  def customer_data
    CSV.open("#{filepath}/customers.csv",
    headers: true, header_converters: :symbol)
  end

  def trans_data
    CSV.open("#{filepath}/transactions.csv",
    headers: true, header_converters: :symbol)
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
    invoice_repository.find_by_id(invoice_id)
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
    invoice_ids.map do |invoice_id|
      transaction_repository.find_all_by_invoice_id(invoice_id)
    end
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

  def merchant_rev_by_date(merchant_repository_ids, date)
    invoice_repository.merchant_rev_by_date(merchant_repository_ids, date)
  end
end

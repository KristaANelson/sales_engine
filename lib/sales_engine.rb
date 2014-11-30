lib_dir = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_dir)
puts __dir__
data_dir = File.expand_path('../data', __dir__)
$LOAD_PATH.unshift(data_dir)

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

  attr_reader :merchant_repository,
              :invoice_repository,
              :item_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository,
              :filepath

  def initialize(filepath)
    @filepath = filepath
  end

  def load_csv_data(directory, filename, entry_class)
    csv = CSV.open(File.join(directory, filename), headers: true, header_converters: :symbol)
    csv.map { |row| entry_class.new(row, self) }       #retuns array of objects
  end

  def startup
    @merchant_repository     = MerchantRepository.new(load_csv_data(filepath, 'merchants.csv', Merchant))
    @invoice_repository      = InvoiceRepository.new(load_csv_data(filepath, 'invoices.csv', Invoice))
    @item_repository         = ItemRepository.new
    @invoice_item_repository = InvoiceItemRepository.new
    @customer_repository     = CustomerRepository.new(load_csv_data(filepath, 'customers.csv', Customer))
    @transaction_repository  = TransactionRepository.new
  end
end

lib_dir = File.expand_path('../lib', __dir__)    # => "/Users/kristaanelson/Turing/take_2/sales_engine/lib"
$LOAD_PATH.unshift(lib_dir)                      # => ["/Users/kristaanelson/Turing/take_2/sales_engine/lib", "/Users/kristaanelson/.rvm/gems/ruby-2.1.3/gems/seeing_is_believing-2.1.4/lib", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0/x86_64-darwin14.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0/x86_64-darwin14.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/x86_64-darwin14.0"]
puts __dir__                                     # => nil
data_dir = File.expand_path('../data', __dir__)  # => "/Users/kristaanelson/Turing/take_2/sales_engine/data"
$LOAD_PATH.unshift(data_dir)                     # => ["/Users/kristaanelson/Turing/take_2/sales_engine/data", "/Users/kristaanelson/Turing/take_2/sales_engine/lib", "/Users/kristaanelson/.rvm/gems/ruby-2.1.3/gems/seeing_is_believing-2.1.4/lib", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0/x86_64-darwin14.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0/x86_64-darwin14.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0", "/Users/kristaanelson/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/x86_64-darwin14.0"]

require "csv"                               # => true         # => true
require_relative "merchant_repository"      # => true
require_relative "customer_repository"      # => true
require_relative "invoice_repository"       # => true
require_relative "invoice_item_repository"  # => true
require_relative "transaction_repository"   # => true
require_relative "item_repository"          # => true


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
  end

  def load_csv_data(filepath, filename, entry_class)
    csv = CSV.open(File.join(filepath, filename), headers: true, header_converters: :symbol)
    csv.map { |row| entry_class.new(row, self) }       #retuns array of objects. Is this a problem? We have sales engine talking to lowest level classes.
  end

  def startup
    @merchant_repository     = MerchantRepository.new(load_csv_data(filepath, 'merchants.csv', Merchant))
    @invoice_repository      = InvoiceRepository.new(load_csv_data(filepath, 'invoices.csv', Invoice))
    @item_repository         = ItemRepository.new
    @invoice_item_repository = InvoiceItemRepository.new
    @customer_repository     = CustomerRepository.new(load_csv_data(filepath, 'customers.csv', Customer))
    @transaction_repository  = TransactionRepository.new(load_csv_data(filepath, 'transactions.csv', Transaction))
  end
end

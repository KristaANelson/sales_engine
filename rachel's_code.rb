class SalesEngine


  def initialize(dir == "data")
    @dir = dir
  end

  def startup
    merchants_csv = CSVHandler.new("./#{dir}/merchants.csv")
    @merchants_repository = MerchantRepsoitory.new(self, merchants_csv.data)

    invoices_csv = CSVHandler.new("./#{dir}/invoices.csv")
    @invoice_repository = InvoiceRepository.new(self, invoice_csv.data)


  end

  def find_items_by_merchant_id(id)
    item_repository.find)all_by_merchant_id(id)
  end

class CSVHandler
  attr_reader :data

  def initialize(fielname
    @data = CSV.open(filename, headers:true, headers
  end

end)))

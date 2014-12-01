require 'pry'
require 'csv'
require_relative 'invoice'
require_relative 'generic_repository_helper'
require_relative 'invoice_repository_helper'


class InvoiceRepository
  include GenericRepositoryHelper
  include InvoiceRepositoryHelper
  attr_reader :repository, :sales_engine

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @repository = []
  end

  def inspect
    "I am a Invoice repo, inspect was called."
  end

  def loader(filepath)
    csv = CSV.open(File.join(filepath, 'invoices.csv'), headers: true, header_converters: :symbol)
    @repository = csv.map { |row| Invoice.new(row, self) }
  end

  def find_transactions_using_id(id)
    sales_engine.find_transcations_using_invoice(id)
  end

  def find_items_using_id(id)
    sales_engine.find_items_using_invoice(id)
  end

end

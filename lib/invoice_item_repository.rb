require 'pry'
require_relative 'invoice_item'
require_relative 'generic_repository_helper'
require_relative 'invoice_item_repository_helper'


class InvoiceItemRepository
  include GenericRepositoryHelper
  include InvoiceItemRepositoryHelper
  
  attr_reader :repository, :sales_engine

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @repository = []
  end

  def inspect
    "I am a Invoice Item repo, inspect was called."
  end

  def loader(filepath)
    csv = CSV.open(File.join(filepath, 'invoice_items.csv'), headers: true, header_converters: :symbol)
    @repository = csv.map { |row| InvoiceItem.new(row, self) }
  end

  def find_items_using(item_id)
    sales_engine.find_item_using_item_id(item_id)
  end
end

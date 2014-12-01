require 'pry'
require 'csv'
require_relative 'item'
require_relative 'item_repository_helper'
require_relative 'generic_repository_helper'

class ItemRepository
  include GenericRepositoryHelper
  include ItemRepositoryHelper

  attr_reader :repository, :sales_engine

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @repository = []
  end

  def inspect
    "I am a Item repo, inspect was called."
  end

  def loader(filepath)
    csv = CSV.open(File.join(filepath, 'items.csv'), headers: true, header_converters: :symbol)
    @repository = csv.map { |row| Item.new(row, self) }
  end

  def find_invoice_items_using_item_id(id)
    sales_engine.find_invoice_items_using_item_id(id)
  end

  def find_merchant_using_merchant_id(merchant_id)
    sales_engine.find_merchant_using_merchant_id(merchant_id)
  end
end

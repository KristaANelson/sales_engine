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

  def most_revenue(top_n_items)
      @repository.sort_by(&:total_revenue_for_each_item).reverse.take(top_n_items)
    # x = @repository.sort_by {|item| item_total_revenue(item)}[-top_n_items..-1].reverse
    # x = @repository.sort {|a,b| item_total_revenue(b) <=> item_total_revenue(a)}.take(5)   #try to make it owrk with top_n_items
  end

  def item_total_revenue(item)
    item.invoice_items.reduce(0) {|sum, invoice_item| sum + invoice_item.quantity * invoice_item.unit_price}
  end

  def most_items(top_n_items)
    x = @repository.sort_by(&:quantity_sold).reverse.take(top_n_items)
  end

  # def item_total_sold(item)
  #   item.invoice_items.reduce(0) {|sum, invoice_item| sum + invoice_item.quantity}
  # end

  def find_highest_revenue_date_using_item(id)
    sales_engine.find_highest_revenue_date_using_item(id)
  end
end

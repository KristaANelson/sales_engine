require 'pry'
require 'csv'
require_relative 'merchant'
require_relative 'generic_repository_helper'
require_relative 'merchant_repository_helper'


class MerchantRepository
  include GenericRepositoryHelper
  include MerchantRepositoryHelper

  attr_reader :repository, :sales_engine

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @repository = []
  end

  def inspect
    "I am a Merchant repo, inspect was called."
  end

  def loader(filepath)
    csv = CSV.open(File.join(filepath, 'merchants.csv'), headers: true, header_converters: :symbol)
    @repository = csv.map { |row| Merchant.new(row, self) }
  end

  def find_items_using(id)
    sales_engine.find_items_using_merchant(id)
  end

  def find_invoices_using(id)
    sales_engine.find_invoices_using_merchant(id)
  end

  def revenue(date)   #using merchant id, this method call returns revenue for a specific date. have to go through:invoices, invoice_items, successful transactions, revenue
    merchant_repository_ids = repository.map {|merchant| merchant.id}
    sales_engine.returns_revenue_for_all_merchants_on_specific_date(merchant_repository_ids, date)
  end

  def most_revenue(top_n_merchants)
    repository.sort_by(&:revenue).reverse.take(top_n_merchants)
  end

  def most_items(top_n_merchants)
    repository.sort_by(&:total_items_sold_for_a_merchant).reverse.take(top_n_merchants)
  end

  def find_customers_using_customer_id(customer_id)
    sales_engine.find_customers_using_customer_id(customer_id)
  end
end

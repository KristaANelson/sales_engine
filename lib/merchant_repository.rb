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
end

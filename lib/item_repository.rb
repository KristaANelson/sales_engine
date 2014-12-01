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
end

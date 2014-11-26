require 'pry'
require 'csv'
require_relative 'invoice_item'


class InvoiceItemRepository
  include GenericRepositoryHelper
  include InvoiceItemRepositoryHelper
  attr_reader :repository

  def initialize(filename = "./data/invoice_items.csv")
    @repository = []
    @filename = filename
  end

  def inspect
    "I am a Invoice repo, inspect was called."
  end
end

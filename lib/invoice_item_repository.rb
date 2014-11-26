require 'pry'
require 'csv'
require_relative 'invoice_item'
require_relative 'generic_repository_helper'
require_relative 'invoice_item_repository_helper'


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

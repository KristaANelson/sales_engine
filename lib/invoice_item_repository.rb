require 'pry'
require_relative 'invoice_item'
require_relative 'generic_repository_helper'
require_relative 'invoice_item_repository_helper'


class InvoiceItemRepository
  include GenericRepositoryHelper
  include InvoiceItemRepositoryHelper
  attr_reader :repository, :filename

  def initialize(invoice_items)
    @repository = invoice_items
    @filename = filename
  end

  def inspect
    "I am a Invoice Item repo, inspect was called."
  end
end

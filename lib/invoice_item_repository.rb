require 'pry'
require 'csv'
require_relative 'invoice_item'


class InvoiceItemRepository
  attr_reader :invoice_item_repository

  def initialize
    @invoice_item_repository = []
  end

  def inspect
    "I am a Invoice repo, inspect was called."
  end

  def load_file(filename = 'invoice_items.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      @invoice_item_repository << InvoiceItem.new(row)
    end

  end
end

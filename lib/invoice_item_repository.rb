require 'pry'
require 'csv'
require_relative 'invoice_item'


class InvoiceItemRepository
  attr_reader :repository

  def initialize
    @repository = []
  end

  def inspect
    "I am a Invoice repo, inspect was called."
  end

  def load_file(filename = 'invoice_items.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      repository << InvoiceItem.new(row)
    end

  end
end

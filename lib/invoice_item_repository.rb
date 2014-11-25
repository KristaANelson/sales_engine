require 'pry'
require 'csv'
require_relative 'invoice_item'


class InvoiceItemRepo
  attr_reader :invoice_item_repository

  def initialize
    @invoice_item_repository = []
  end

  def load_file(filename = 'invoice_items.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      @invoice_item_repository << InvoiceItem.new(row)
    end

  end
end

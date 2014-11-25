require 'pry'
require 'csv'
require_relative 'invoice'


class InvoiceRepo
  attr_reader :invoice_repository

  def initialize
    @invoice_repository = []
  end

  def load_file(filename = 'invoices.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      @invoice_repository << Invoice.new(row)
    end

  end
end

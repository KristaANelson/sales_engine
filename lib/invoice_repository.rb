require 'pry'
require 'csv'
require_relative 'invoice'
require_relative 'generic_repository_helper'
require_relative 'invoice_repository_helper'


class InvoiceRepository
  include GenericRepositoryHelper
  include InvoiceRepositoryHelper
  attr_reader :repository

  def initialize(invoices)
    @repository = invoices
  end

  def inspect
    "I am a Invoice repo, inspect was called."
  end

  def load_file(filename = 'invoices.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      repository << Invoice.new(row)
    end

  end
end

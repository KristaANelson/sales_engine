require 'pry'
require 'csv'
require_relative 'transaction'


class TransactionRepository
  attr_reader :transaction_repository

  def initialize
    @transaction_repository = []
  end

  def inspect
    "I am a Transaction repo, inspect was called."
  end

  def load_file(filename = 'transactions.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      @transaction_repository << Transaction.new(row)
    end
  end
end

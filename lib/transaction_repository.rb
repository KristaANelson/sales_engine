require 'pry'
require 'csv'
require_relative 'transaction'
require_relative 'generic_repository_helper'
require_relative 'transaction_repository_helper'


class TransactionRepository
  include GenericRepositoryHelper
  include TransactionRepositoryHelper

  attr_reader :repository, :sales_engine

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @repository = []
  end

  def inspect
    "I am a Transaction repo, inspect was called."
  end

  def loader(filepath)
    csv = CSV.open(File.join(filepath, 'transactions.csv'), headers: true, header_converters: :symbol)
    @repository = csv.map { |row| Transaction.new(row, self) }
  end
end

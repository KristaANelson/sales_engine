require 'pry'
require 'csv'
require_relative 'transaction'
require_relative 'generic_repository_helper'
require_relative 'transaction_repository_helper'


class TransactionRepository
  include GenericRepositoryHelper
  include TransactionRepositoryHelper

  attr_reader :repository

  def initialize(transactions)   #actual array of transaction objects
    @repository = transactions
  end

  def inspect
    "I am a Transaction repo, inspect was called."
  end

end

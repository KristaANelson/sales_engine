require 'pry'
require 'csv'
require_relative 'transaction'
require_relative 'generic_repository_helper'
require_relative 'transaction_repository_helper'


class TransactionRepository
  include GenericRepositoryHelper
  include TransactionRepositoryHelper

  attr_reader :repository, :sales_engine

  def initialize(sales_engine, transaction_data)
    @sales_engine = sales_engine
    @repository = transaction_data.map {|row| Transaction.new(row, self)}
  end

  def inspect
    "I am a Transaction repo, inspect was called."
  end

  def find_invoices_using(invoice_id)
    sales_engine.find_invoices_using_invoice_id(invoice_id)
  end

  def create_transaction(transaction_data, id)
    data =
    {
    id: new_id,
    invoice_id: id,
    credit_card_number: transaction_data[:credit_card_number],
    credit_card_expiration_date: transaction_data[:credit_card_expiration_date],
    result: transaction_data[:result],
    created_at: Date.today.to_s,
    updated_at: Date.today.to_s
    }
    @repository << Transaction.new(data, self)
  end

  def new_id
    @repository.max_by {|transaction| transaction.id}.id + 1
  end
end

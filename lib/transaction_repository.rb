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


  # def create_invoice_items(items, new_invoice_id)
  #   grouped_items = items.group_by {|item| item}
  #   grouped_items.each do |group|
  #     insert_item(group, new_invoice_id)
  #   end
  # end
  #
  # def insert_item(group, new_invoice_id)
  #   item = group.shift
  #   data =
  #   {
  #     id: new_invoice_item_id,
  #     item_id: item.id,
  #     invoice_id: new_invoice_id,
  #     quantity: group.flatten.size,
  #     unit_price: item.unit_price,
  #     created_at: Date.today.to_s,
  #     updated_at: Date.today.to_s
  #   }
  #   @repository << InvoiceItem.new(data, self)
  # end
  #
  # def new_invoice_item_id
  #   @repository.max_by {|invoice_item| invoice_item.id}.id + 1
  # end
  #
end

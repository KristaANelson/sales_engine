require 'pry'
require_relative 'invoice_item'
require_relative 'generic_repository_helper'
require_relative 'invoice_item_repository_helper'


class InvoiceItemRepository
  include GenericRepositoryHelper
  include InvoiceItemRepositoryHelper

  attr_reader :repository, :sales_engine

  def initialize(sales_engine, invoice_item_data)
    @sales_engine = sales_engine
    @repository = invoice_item_data.map {|row| InvoiceItem.new(row, self)}
  end

  def inspect
    "I am a Invoice Item repo, inspect was called."
  end

  def find_item_using(item_id)
    sales_engine.find_item_using_item_id(item_id)
  end

  def find_invoice_using(invoice_id)
    sales_engine.find_invoice_using(invoice_id)
  end

  def create_invoice_items(items, new_invoice_id)
    grouped_items = items.group_by {|item| item}
    grouped_items.each do |group|
      insert_item(group, new_invoice_id)
    end
  end

  def insert_item(group, new_invoice_id)
    item = group.shift
    data =
    {
      id: new_invoice_item_id,
      item_id: item.id,
      invoice_id: new_invoice_id,
      quantity: group.flatten.size,
      unit_price: item.unit_price,
      created_at: Date.today.to_s,
      updated_at: Date.today.to_s
    }
    @repository << InvoiceItem.new(data, self)
  end

  def new_invoice_item_id
    @repository.max_by {|invoice_item| invoice_item.id}.id + 1
  end

  # def successful_invoice_items
  #   repository.select {|invoice_item| invoice_item.invoice.charged?}
  # end
end

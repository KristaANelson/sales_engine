require 'pry'
require 'csv'
require_relative 'customer'
require_relative 'generic_repository_helper'
require_relative 'customer_repository_helper'


class CustomerRepository
  include GenericRepositoryHelper
  include CustomerRepositoryHelper

  attr_reader :repository, :sales_engine, :file

  def initialize(sales_engine, customer_data)
    @sales_engine = sales_engine
    @repository = customer_data.map {|row| Customer.new(row,self)}
  end

  def inspect
    "I am a customer repo, inspect was called."
  end

  def find_invoices_using(id)
    sales_engine.find_invoices_using_customer_id(id)
  end

  def find_transactions_using_customer_id(id)
    sales_engine.find_transactions_using_customer_id(id)
  end

  def find_favorite_merchant_using_customer_id(id)
    sales_engine.find_favorite_merchant_using_customer_id(id)
  end

end

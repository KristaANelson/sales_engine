require 'pry'
require 'csv'
require_relative 'customer'
require_relative 'generic_repository_helper'
require_relative 'customer_repository_helper'


class CustomerRepository
  include GenericRepositoryHelper
  include CustomerRepositoryHelper
  attr_reader :repository, :filename

  def initialize(filename = "/Users/kristaanelson/Turing/take_2/sales_engine/data/customers.csv")
    @repository = []
    @filename = filename
  end

  def inspect
    "I am a customer repo, inspect was called."
  end

  def process
    @repository = load_file(filename, Customer)
  end

end

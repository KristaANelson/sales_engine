require 'pry'
require 'csv'
require_relative 'customer'
require_relative '_repository_helper'


module CustomerRepository
  include GenericRepositoryHelper
  include CustomerRepositoryHelper
  attr_reader :repository, :filename

  def initialize(filename = "../sales_engine/data/customers.csv")
    @repository = []
    @filename = filename
  end

  def inspect
    "I am a customer repo, inspect was called."
  end

  def process
    #load_file(filename, Customer)
  end

end

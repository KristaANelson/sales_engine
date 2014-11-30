require 'pry'
require 'csv'
require_relative 'customer'
require_relative 'generic_repository_helper'
require_relative 'customer_repository_helper'


class CustomerRepository
  include GenericRepositoryHelper
  include CustomerRepositoryHelper
  attr_reader :repository, :filename

  def initialize(customers)
    @repository = customers   #@repository should be an array of objects
  end

  def inspect
    "I am a customer repo, inspect was called."
  end
end

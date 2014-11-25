require 'pry'
require 'csv'
require_relative 'customer'


class CustomerRepository
  attr_reader :customer_repository

  def initialize
    @customer_repository = []
  end


  def inspect
    "I am a customer repo, inspect was called."
  end
  

  def load_file(filename)
    csv = CSV.open(filename, headers: true, header_converters: :symbol)
    csv.each do |row|
      @customer_repository << Customer.new(row)
    end

  end

  def all
    @customer_repository
  end

  def random
    @customer_repository.sample
  end

  def find_by_id(criteria)
    selected = customer_repository.find do |customer|
      customer.id == criteria
    end
  end


  def find_by_last_name(criteria)
    selected = customer_repository.find do |customer|
      customer.last_name == criteria.strip.capitalize
    end
  end

  def find_by_first_name(criteria)
    selected = customer_repository.find do |customer|
      customer.first_name == criteria.strip.capitalize
    end
  end

  def find_by_created_at
    selected = customer_repository.find do |customer|
      customer.created_at == criteria.strip
    end
  end

  def find_by_updated_at
    selected = customer_repository.find do |customer|
      customer.updated_at == criteria.strip
    end
  end

  def find_all_by_last_name(criteria)
    selected = customer_repository.select do |customer|
      customer.last_name == criteria.strip.capitalize
    end
  end

  def find_all_by_first_name(criteria)
    selected = customer_repository.select do |customer|
      customer.first_name == criteria.strip.capitalize
    end
  end


end

# cust_repo = CustomerRepo.new
# cust_repo.load_file('test_customers.csv')
#

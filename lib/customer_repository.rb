require 'pry'
require 'csv'
require_relative 'customer'


class CustomerRepo
  attr_reader :customer_repository

  def initialize
    @customer_repository = []
  end

  def load_file(filename = 'customers.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      @customer_repository << Customer.new(row)
    end

  end
end

# cust_repo = CustomerRepo.new
# cust_repo.load_file('test_customers.csv')
#

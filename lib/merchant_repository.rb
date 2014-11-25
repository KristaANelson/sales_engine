require 'pry'                # => true
require 'csv'                # => true
require_relative 'merchant'  # => true


class MerchantRepository
  attr_reader :merchant_repository  # => nil

  def initialize
    @merchant_repository = []
  end

  def inspect
    "I am a Merchant repo, inspect was called."
  end

  def load_file(filename, klass)
    csv = CSV.open(filename, headers: true, header_converters: :symbol)
    csv.map do |row|
      klass.new(row)
    end
  end
end

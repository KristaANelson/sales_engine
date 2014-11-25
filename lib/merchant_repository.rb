require 'pry'                # => true
require 'csv'                # => true
require_relative 'merchant'  # => true


class MerchantRepo
  attr_reader :merchant_repository  # => nil

  def initialize
    @merchant_repository = []
  end

  def load_file(filename = 'merchants.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      @merchant_repository << Merchant.new(row)
    end
  end
end

require 'pry'                # => true
require 'csv'                # => true
require_relative 'item'  # => true


class ItemRepo
  attr_reader :item_repository  # => nil

  def initialize
    @item_repository = []
  end

  def load_file(filename = 'items.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      @item_repository << Item.new(row)
    end
  end
end

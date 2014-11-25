require 'pry'
require 'csv'
require_relative 'item'


class ItemRepository
  attr_reader :item_repository

  def initialize
    @item_repository = []
  end

  def inspect
    "I am a Item repo, inspect was called."
  end

  def load_file(filename = 'items.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      @item_repository << Item.new(row)
    end
  end
end

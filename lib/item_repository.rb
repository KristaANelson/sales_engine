require 'pry'
require 'csv'
require_relative 'item'


class ItemRepository
  attr_reader :repository

  def initialize
    @repository = []
  end

  def inspect
    "I am a Item repo, inspect was called."
  end

  def load_file(filename = 'items.csv')
    csv = CSV.open("./data/#{filename}", headers: true, header_converters: :symbol)
    csv.each do |row|
      repository << Item.new(row)
    end
  end
end

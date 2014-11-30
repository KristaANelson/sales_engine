require 'pry'
require 'csv'
require_relative 'item'
require_relative 'item_repository_helper'
require_relative 'generic_repository_helper'

class ItemRepository
  include GenericRepositoryHelper
  include ItemRepositoryHelper

  attr_reader :repository

  def initialize(items)
    @repository = items
  end
  
  def inspect
    "I am a Item repo, inspect was called."
  end
end

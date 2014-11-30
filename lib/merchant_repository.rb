require 'pry'                # => true
require 'csv'                # => true
require_relative 'merchant'
require_relative 'generic_repository_helper'
require_relative 'merchant_repository_helper'  # => true


class MerchantRepository
  include GenericRepositoryHelper
  include MerchantRepositoryHelper
  
  attr_reader :repository  # => nil

  def initialize(merchants)   #array of merchant objects
    @repository = merchants
  end

  def inspect
    "I am a Merchant repo, inspect was called."
  end
end

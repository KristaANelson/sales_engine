require_relative 'test_helper'
require 'csv'
require 'merchant_repository'


class MerchantRepoTest < Minitest::Test

  def test_find_by_name_works
    merchant_repo = MerchantRepository.new([
      Merchant.new({:name => "Schroeder-Jerde"}, self),
      Merchant.new({:name => "Klein, Rempel and Jones"}, self),
      Merchant.new({:name => "Cummings-Thiel"}, self)
      ])
    assert_equal "Schroeder-Jerde", merchant_repo.find_by_name("Schroeder-Jerde").name

  end
end

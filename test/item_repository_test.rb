require_relative 'test_helper'
require 'csv'
require 'item_repository'


class ItemRepoTest < Minitest::Test

  def test_load_file_method_and_that_it_loads_rows
    item_repo = ItemRepo.new
    item_repo.load_file('test_items.csv')
    assert_equal item_repo.item_repository.length, 10
  end
end

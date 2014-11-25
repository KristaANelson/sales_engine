require_relative 'test_helper'
require 'invoice_item_repository'
require 'csv'

class InvoiceItemRepoTest <Minitest::Test
  def test_load_file_method_and_that_it_loads_rows
    invoice_item_repo = InvoiceItemRepo.new
    invoice_item_repo.load_file('test_invoice_items.csv')
    assert_equal 10, invoice_item_repo.invoice_item_repository.length
  end
end

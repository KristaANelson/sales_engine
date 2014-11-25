require_relative 'test_helper'
require 'invoice_repository'
require 'csv'

class InvoiceRepoTest <Minitest::Test
  def test_load_file_method_and_that_it_loads_rows
    invoice_repo = InvoiceRepo.new
    invoice_repo.load_file('test_invoices.csv')
    assert_equal 10, invoice_repo.invoice_repository.length
  end
end

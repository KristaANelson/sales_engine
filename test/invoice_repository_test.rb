require_relative 'test_helper'
require 'invoice_repository'
require 'csv'

class InvoiceRepoTest <Minitest::Test
  def test_find_all_by_customer_id
    repo = InvoiceRepository.new([
      Invoice.new({:customer_id => "111"}, self),
      Invoice.new({:customer_id => "222"}, self),
      Invoice.new({:customer_id => "222"}, self)
    ])
    assert_equal '111', repo.find_all_by_customer_id('111')[0].customer_id
    assert_equal '222', repo.find_all_by_customer_id('222')[0].customer_id
    assert_equal '222', repo.find_all_by_customer_id('222')[1].customer_id
    assert_equal  [] , repo.find_all_by_customer_id('333')
  end
end

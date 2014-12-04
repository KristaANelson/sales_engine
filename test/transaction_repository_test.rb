# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'transaction_repository'
require 'sales_engine'
require 'csv'

class TransactionRepoTest < Minitest::Test

  attr_reader :data,
              :parent,
              :transaction_repository,
              :filepath

  def setup
    @filepath = File.expand_path('../../test_data',  __FILE__)
    @data = CSV.open("#{filepath}/test_transactions.csv", headers: true, header_converters: :symbol)
    @parent = Minitest::Mock.new
    @transaction_repository = TransactionRepository.new(parent, data)
  end

  def test_find_all_id
    assert_equal 1, transaction_repository.find_all_by_id(1).count
    assert_equal [], transaction_repository.find_all_by_id(72)
  end


  def test_find_by_id
    assert_equal 1, transaction_repository.find_by_id(1).invoice_id
    assert_equal nil, transaction_repository.find_by_id(54)
  end

  def test_find_all_invoice_id
    assert_equal 1, transaction_repository.find_all_by_invoice_id(1).count
    assert_equal [], transaction_repository.find_all_by_invoice_id(72)
  end


  def test_find_by_invoice_id
    assert_equal 1, transaction_repository.find_by_invoice_id(1).id
    assert_equal nil, transaction_repository.find_by_invoice_id(54)
  end

  def test_find_all_by_created_at_date
    assert_equal 10, transaction_repository.find_all_by_created_at(Date.parse('2012-03-27 14:53:59 UTC')).count
    assert_equal [], transaction_repository.find_all_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_by_created_at_date
    assert_equal Transaction, transaction_repository.find_by_created_at(Date.parse('2012-03-27 14:53:59 UTC')).class
    assert_equal nil, transaction_repository.find_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_all_by_updated_at_date
    assert_equal 10, transaction_repository.find_all_by_updated_at(Date.parse('2012-03-27 14:53:59 UTC')).count
    assert_equal [], transaction_repository.find_all_by_updated_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_by_updated_at_date
    assert_equal Transaction, transaction_repository.find_by_updated_at(Date.parse('2012-03-27 14:53:59 UTC')).class
    assert_equal nil, transaction_repository.find_by_updated_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_items_find_invoices_using
    parent.expect(:find_invoices_using_invoice_id, nil, [1])
    transaction_repository.find_invoices_using(1)
    parent.verify
  end

  def test_new_id_next_id
  assert_equal 11, transaction_repository.new_id
  end

end

def test_that_transaction_repository_holds_credit_card_info
  filepath = File.expand_path('../../data', __FILE__)
  engine = SalesEngine.new(filepath)
  engine.startup
  assert_equal "4654405418249632", engine.transaction_repository.repository.first.credit_card_number
end

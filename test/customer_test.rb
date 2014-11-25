class CustomerTest < Minitest::Test
  def test_it_has_an_id
   data = { id: 1,
            first_name:	Joey,
            last_name:	Ondricka,
            created_at:	2012-03-27 14:54:09 UTC,
            updated_at:	2012-03-27 14:54:09 UTC}
   customer = Customer.new(data)
   

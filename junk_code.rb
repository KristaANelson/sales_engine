#this is how you get back and forth between classes in sales_engine


#in item repository, you have some item creation going on like below. Item
#repository is the higher level class that speaks to items.

Item.new(data, self)



#in item

class Item
  attr_reader :repo
  def initi(data, repo)
    #data stuff
    @repo = repo
  end

  def merchant
    repo.merchant(id)   #this is how you get back ItemRepository
  end
end









#sales_engine_test
class SalesEngineTest < Miniitest::Test
  def test_a_sales_engine_can_be_instantiated
    assert SalesEngine.new
  end

  def test_a_sales_engine_has_an_item_repository
    se = SalesEngine.new
    assert se.item_repository
  end
end



#test
class ItemRepositoryTest < Minitest::Test
  def test_it_creates_items
    ir = ItemRepository.new
    assert_equal 0, ir.count
    ir.create_item(:name => "Sample 1")
    ir.create_item(:name => "Sample 2")
    assert_equal 2, ir.count
    assert_equal "Sample 1", ir.items[0].name
    assert_equal "Sample 2", ir.items[1].name
  end
end




#itemRepository class
class ItemRepository
  attr_reader :items

  def initialize
    @items = []
  end

  def count
    items.count
  end

  def create_item(data)
    items << Item.new(data, self)
  end
end

class Item
  attr_reader :name

  def initialize(data, self)
    @name = data[:name]
  end
end



#test)item

class ItemTest << Minitest::Test
  def test_it_knows_where_it_came_from
    item_repo = ItemRepository.new
    item_repo.create_item(:name => "The Thing"
    item = item_repo.items.first
    assert_equal item_repo, item.repostiry
  end

  def test_it_can_find_the_associated_merchant
    se = SalesEngine.new
    se.merchant_repository.create_merchant(:name => "The Thing", :id => 24)
    merchant = se.merchant_repository.merchants.first
    se.item_repository.create_item(:name => "Thing 3", :merchant_id => 24)
    assert_equal merchant, item.merchant
  end
end





#mocks

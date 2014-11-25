module RepositoryHelper

  def all
    @customer_repository
  end

  def random
    @customer_repository.sample
  end

  def find_by_id(criteria)
    selected = customer_repository.find do |customer|
      customer.id == criteria
    end
  end


  def find_by_last_name(criteria)
    selected = customer_repository.find do |customer|
      customer.last_name == criteria.strip.capitalize
    end
  end

  def find_by_first_name(criteria)
    selected = customer_repository.find do |customer|
      customer.first_name == criteria.strip.capitalize
    end
  end

  def find_by_created_at
    selected = customer_repository.find do |customer|
      customer.created_at == criteria.strip
    end
  end

  def find_by_updated_at
    selected = customer_repository.find do |customer|
      customer.updated_at == criteria.strip
    end
  end

  def find_all_by_last_name(criteria)
    selected = customer_repository.select do |customer|
      customer.last_name == criteria.strip.capitalize
    end
  end

  def find_all_by_first_name(criteria)
    selected = customer_repository.select do |customer|
      customer.first_name == criteria.strip.capitalize
    end
  end

end

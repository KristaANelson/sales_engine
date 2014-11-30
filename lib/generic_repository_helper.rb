require 'pry'
module GenericRepositoryHelper

  def load_file(filename, entry_class)   #do we need this method since we have a load in sales engine?
    csv = CSV.open(filename, headers: true, header_converters: :symbol)
    csv.map do |row|
      entry_class.new(row)
    end
  end

  def all
    @repository
  end

  def random
    @repository.sample
  end

  def find_by(attribute, criteria)
    repository.find {|entry| entry.send(attribute) == criteria}
  end

  def find_all_by(attribute, criteria)
    repository.select {|entry| entry.send(attribute) == criteria}
  end

  def find_by_id(criteria)
    find_by(:id, criteria)
  end

  def find_all_by_id(criteria)
    find_all_by(:id, criteria)
  end

  def find_by_created_at(criteria)
    find_by(:created_at, criteria)
  end

  def find_all_by_created_at(criteria)
    find_all_by(:created_at, criteria)
  end

  def find_by_updated_at(criteria)
    find_by(:updated_at, criteria)
  end

  def find_all_by_updated_at(criteria)
    find_all_by(:updated_at, criteria)
  end

end

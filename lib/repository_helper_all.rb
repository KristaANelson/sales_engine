module RepositoryHelper

  def load_file(filename, klass)
    csv = CSV.open(filename, headers: true, header_converters: :symbol)
    csv.map do |row|
      klass.new(row)
    end
  end

  def all
    @repository
  end

  def random
    @repository.sample
  end

  def find_by_id(criteria)
    find_by(id, criteria)
  end

  def find_by(attribute, criteria)
    repository.find {|entry| entry.send(attribute) == criteria.capitalize.strip}
  end

  def find_by_all(attribute, criteria)
    repository.select {|entry| entry.send(attribute) == criteria.capitalize.strip}
  end

  def find_by_all_id(criteria)
    find_by_all(id, criteria)
  end

  def find_by_created_at(criteria)
    find_by(created_at, criteria)
  end

  def find_by_all_created_at(criteria)
    find_by_all(created_at, criteria)
  end

  def find_by_updated_at(criteria)
    find_by(updated_at, criteria)
  end

  def find_by_all_updated_at(criteria)
    find_by_all(updated_at, criteria)
  end

end

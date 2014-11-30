class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at
              :parent

  def initialize(row, parent)
    @id         = row[:id]
    @name       = row[:name].downcase
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @parent     = parent
  end
end

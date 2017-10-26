class User
  include ActiveModel::Model
  ATTRS = %i[name email active created_at type password choices file sex]
  attr_accessor *ATTRS

  def add_errors
    errors.add :base, 'Some error'
    ATTRS.each { |x| errors.add x }
  end
end

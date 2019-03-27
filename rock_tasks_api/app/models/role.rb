#=== Attributes
#
# :id - pk integer
# :name - string not null
#=== Associoations
#
# :members - has many
class Role < ApplicationRecord
  #associations
  has_many :members

  #validations
  validates_presence_of :name
end

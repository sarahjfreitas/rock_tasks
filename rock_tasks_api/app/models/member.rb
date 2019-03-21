#=== Attributes
#
# :id - pk integer
# :name - string not null
# :email - string not null
#=== Associoations
#
# :role - belongs_to - not null
class Member < ApplicationRecord
  #associations
  belongs_to :role

  #validations
  validates_presence_of :name, :email, :role_id
end

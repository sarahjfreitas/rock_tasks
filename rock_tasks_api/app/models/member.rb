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

  validates :email, 
    :presence => true, 
    :length => {:minimum => 3, :maximum => 254},
    :uniqueness => true,
    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :multiline => true}
    

  validates :name,
    :presence => true, 
    :length => {:minimum => 3, :maximum => 254}

  validates :role_id, :presence => true
end

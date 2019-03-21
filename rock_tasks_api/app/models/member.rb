class Member < ApplicationRecord
  #associations
  belongs_to :role

  #validations
  validates_presence_of :name, :email, :role_id
end

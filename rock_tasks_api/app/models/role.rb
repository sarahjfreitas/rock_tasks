class Role < ApplicationRecord
  #associations
  has_many :members

  #validations
  validates_presence_of :name
end

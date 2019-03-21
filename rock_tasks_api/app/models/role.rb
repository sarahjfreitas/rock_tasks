class Role < ApplicationRecord
  #validation
  validates_presence_of :name
end

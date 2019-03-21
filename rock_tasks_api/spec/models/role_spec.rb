require 'rails_helper'

#tests for Role model
RSpec.describe Role, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Member model
  it { should have_many(:members) }

  # Validation tests
  # ensure column name are present before saving
  it { should validate_presence_of(:name) }
end

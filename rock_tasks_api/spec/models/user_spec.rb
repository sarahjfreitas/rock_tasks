require 'rails_helper'
#tests for user model
RSpec.describe User, type: :model do

  # Validation tests
  # ensure column name are present before saving
  it { should validate_presence_of(:name) }

  # ensure column name are present before saving
  it { should validate_presence_of(:email) }
  
  # ensure column name are present before saving
  it { should validate_presence_of(:password) }
end

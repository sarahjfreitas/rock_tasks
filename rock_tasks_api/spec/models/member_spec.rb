require 'rails_helper'

RSpec.describe Member, type: :model do
  # Association test
  # ensure Member model has a n:1 relationship with the Role model
  it { should belong_to(:role) }

  # Validation tests
  # ensure column name are present before saving
  it { should validate_presence_of(:name) }
  # ensure column email are present before saving
  it { should validate_presence_of(:email) }
  # ensure column role_id are present before saving
  it { should validate_presence_of(:role_id) }
end

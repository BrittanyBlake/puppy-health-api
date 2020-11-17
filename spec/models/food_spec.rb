require 'rails_helper'

RSpec.describe Food, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:time) }
end

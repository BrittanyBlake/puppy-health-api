require 'rails_helper'

RSpec.describe GeneralHealth, type: :model do
  it { should validate_presence_of(:energy_level)}
  it { should validate_presence_of(:hunger_level)}
  it { should validate_presence_of(:date)}
end

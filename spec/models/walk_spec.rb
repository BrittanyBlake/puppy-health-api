require 'rails_helper'

RSpec.describe Walk, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:time)}
  it { should validate_presence_of(:distance)}
  it { should validate_presence_of(:date)}
end

require 'rails_helper'

RSpec.describe Treat, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:treat_type) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:date) }
end

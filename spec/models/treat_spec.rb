require 'rails_helper'

RSpec.describe Treat, type: :model do
  it { should validate_presence_of(:type)}
  it { should validate_presence_of(:amount)}
  it { should validate_presence_of(:date)}
end
require 'rails_helper'

RSpec.describe Medication, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:use) }
  it { should validate_presence_of(:dosage) }
end

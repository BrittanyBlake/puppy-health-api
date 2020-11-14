require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:foods) }
  it { should have_many(:treats) }
  it { should have_many(:walks) }
  it { should have_many(:medications) }
  it { should have_many(:general_healths) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end

require 'rails_helper'
RSpec.describe Store, type: :model do
  describe 'relationships' do
    it { should have_many :store_items }
    it { should have_many :user_stores }
    it { should have_many(:items).through(:store_items) }
    it { should have_many(:users).through(:user_stores) }
  end

  describe 'validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:name) }
  end
end

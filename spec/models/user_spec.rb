require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_stores }
    it { should have_many :user_store_items }
    it { should have_many(:stores).through(:user_stores) }
    it { should have_many(:store_items).through(:user_store_items) }
  end
end

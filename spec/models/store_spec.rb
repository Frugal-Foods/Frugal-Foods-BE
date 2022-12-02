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

  before(:each) do
    # @instance_var = Something.create!(input)
  end

  describe 'class methods' do
    describe '#search' do
      it 'returns partial matches' do
       #method goes here
      end
    end
  end

  describe 'instance methods' do
    describe '#method_name' do
     it 'description of method' do
      #expect statement here
     end
    end
  end

end

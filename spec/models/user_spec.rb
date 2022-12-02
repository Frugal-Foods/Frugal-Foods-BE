require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_stores }
    it { should have_many :user_items }
    it { should have_many(:stores).through(:user_stores) }
    it { should have_many(:items).through(:user_items) }

  end

  describe 'validations' do
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

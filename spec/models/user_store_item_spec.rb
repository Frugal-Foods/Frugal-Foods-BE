require 'rails_helper'
RSpec.describe UserStoreItem, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:store_item) }
    it { should validate_presence_of(:quantity)}
    it { should validate_numericality_of(:quantity)}
    it { should_not allow_value(0).for(:quantity) }
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

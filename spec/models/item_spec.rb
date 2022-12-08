require 'rails_helper'
RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should have_many :store_items }
    it { should have_many(:stores).through(:store_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'class methods' do
    describe '#search' do
      let!(:store_1) { create(:store, zipcode: "83749")}
      let!(:store_2) { create(:store, zipcode: "83749")}
      let!(:item_1) { create(:item, name: "bananas")}
      let!(:item_2) { create(:item)}
      let!(:store_1_item_1) { create(:store_item, store_id: store_1.id, item_id: item_1.id)}
      let!(:store_1_item_2) { create(:store_item, store_id: store_1.id, item_id: item_2.id)}
      let!(:store_2_item_1) { create(:store_item, store_id: store_2.id, item_id: item_1.id)}
      
      it 'returns partial matches' do
        expect(Item.search_items("bana").first.item_name).to eq(item_1.name)
        expect(Item.search_items("bana").first.store_id).to eq(store_1.id)
        expect(Item.search_items("bana").first.store_name).to eq(store_1.name)
        expect(Item.search_items("bana").first.price).to eq(store_1_item_1.price)
        expect(Item.search_items("bana").length).to eq(2)
      end

      it 'returns nil if no item name matches the search word' do
        expect(Item.search_items("cinnamon")).to eq([])
      end
    end
  end
end

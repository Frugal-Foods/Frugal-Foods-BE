require 'rails_helper'
RSpec.describe StoreItem, type: :model do
  describe 'relationships' do
    it { should belong_to :item }
    it { should belong_to :store }
  end

  describe 'validations' do
    it { should validate_presence_of(:price) }
  end

  describe 'instance methods' do
    describe '#item_name' do
      it 'returns the name of an item when called on a store item' do
        the_only_user = User.create!(email: Faker::Internet.email)
        store_1 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address)
        item_1 = Item.create!(name: Faker::Commerce.product_name, photo_url: Faker::Internet.url)
        store_1_item_1 = StoreItem.create!(store_id: store_1.id, item_id: item_1.id, price: Faker::Commerce.price)
        user_store_1_item_1 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_1_item_1.id, quantity: 4)

        expect(store_1_item_1.item_name).to eq(item_1.name)
      end
    end
  end
end
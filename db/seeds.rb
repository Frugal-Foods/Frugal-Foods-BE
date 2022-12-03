# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#the only user
  the_only_user = User.create!(email: Faker::Internet.email)
  
  store_1 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address)
  store_2 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address)
  store_3 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address)
  store_4 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address)
  store_5 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address)

  item_1 = Item.create!(name: Faker::Commerce.product_name)
  item_2 = Item.create!(name: Faker::Commerce.product_name)
  item_3 = Item.create!(name: Faker::Commerce.product_name)
  item_4 = Item.create!(name: Faker::Commerce.product_name)
  item_5 = Item.create!(name: Faker::Commerce.product_name)
  item_6 = Item.create!(name: Faker::Commerce.product_name)
  item_7 = Item.create!(name: Faker::Commerce.product_name)

  user_store_1 = UserStore.create!(store_id: store_1.id, user_id: the_only_user.id)
  user_store_2 = UserStore.create!(store_id: store_2.id, user_id: the_only_user.id)
  user_store_3 = UserStore.create!(store_id: store_3.id, user_id: the_only_user.id)
  user_store_4 = UserStore.create!(store_id: store_4.id, user_id: the_only_user.id)

  store_1_item_1 = StoreItem.create!(store_id: store_1.id, item_id: item_1.id, price: Faker::Commerce.price)
  store_1_item_2 = StoreItem.create!(store_id: store_1.id, item_id: item_2.id, price: Faker::Commerce.price)
  store_1_item_3 = StoreItem.create!(store_id: store_1.id, item_id: item_3.id, price: Faker::Commerce.price)
  store_1_item_4 = StoreItem.create!(store_id: store_1.id, item_id: item_4.id, price: Faker::Commerce.price)
  store_2_item_1 = StoreItem.create!(store_id: store_2.id, item_id: item_1.id, price: Faker::Commerce.price)
  store_2_item_2 = StoreItem.create!(store_id: store_2.id, item_id: item_2.id, price: Faker::Commerce.price)
  store_2_item_3 = StoreItem.create!(store_id: store_2.id, item_id: item_3.id, price: Faker::Commerce.price)
  store_2_item_4 = StoreItem.create!(store_id: store_2.id, item_id: item_4.id, price: Faker::Commerce.price)
  store_3_item_4 = StoreItem.create!(store_id: store_3.id, item_id: item_4.id, price: Faker::Commerce.price)
  store_3_item_5 = StoreItem.create!(store_id: store_3.id, item_id: item_5.id, price: Faker::Commerce.price)
  store_3_item_6 = StoreItem.create!(store_id: store_3.id, item_id: item_6.id, price: Faker::Commerce.price)
  store_3_item_7 = StoreItem.create!(store_id: store_3.id, item_id: item_7.id, price: Faker::Commerce.price)

  user_store_1_item_1 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_1_item_1.id)
  user_store_1_item_2 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_1_item_2.id)
  user_store_1_item_3 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_1_item_3.id)
  user_store_1_item_4 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_1_item_4.id)
  user_store_2_item_1 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_2_item_1.id)
  user_store_2_item_2 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_2_item_2.id)
  user_store_2_item_3 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_2_item_3.id)
  user_store_2_item_4 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_2_item_4.id)
  user_store_3_item_4 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_3_item_4.id)
  user_store_3_item_5 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_3_item_5.id)
  user_store_3_item_6 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_3_item_6.id)
  user_store_3_item_7 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_3_item_7.id)











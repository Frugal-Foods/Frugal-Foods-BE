# #the only user
#   the_only_user = User.create!(email: Faker::Internet.email)
  
#   store_1 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address, zipcode: "83749")
#   store_2 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address, zipcode: "83749")
#   store_3 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address, zipcode: "83749")
#   store_4 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address, zipcode: "83749")
#   store_5 = Store.create!(name: Faker::Company.name, address: Faker::Address.full_address, zipcode: "83749")

#   item_1 = Item.create!(name: Faker::Commerce.product_name, photo_url: Faker::Internet.url)
#   item_2 = Item.create!(name: Faker::Commerce.product_name, photo_url: Faker::Internet.url)
#   item_3 = Item.create!(name: Faker::Commerce.product_name, photo_url: Faker::Internet.url)
#   item_4 = Item.create!(name: Faker::Commerce.product_name, photo_url: Faker::Internet.url)
#   item_5 = Item.create!(name: Faker::Commerce.product_name, photo_url: Faker::Internet.url)
#   item_6 = Item.create!(name: Faker::Commerce.product_name, photo_url: Faker::Internet.url)
#   item_7 = Item.create!(name: Faker::Commerce.product_name, photo_url: Faker::Internet.url)

#   user_store_1 = UserStore.create!(store_id: store_1.id, user_id: the_only_user.id)
#   user_store_2 = UserStore.create!(store_id: store_2.id, user_id: the_only_user.id)
#   user_store_3 = UserStore.create!(store_id: store_3.id, user_id: the_only_user.id)
#   user_store_4 = UserStore.create!(store_id: store_4.id, user_id: the_only_user.id)

#   store_1_item_1 = StoreItem.create!(store_id: store_1.id, item_id: item_1.id, price: Faker::Commerce.price)
#   store_1_item_2 = StoreItem.create!(store_id: store_1.id, item_id: item_2.id, price: Faker::Commerce.price)
#   store_1_item_3 = StoreItem.create!(store_id: store_1.id, item_id: item_3.id, price: Faker::Commerce.price)
#   store_1_item_4 = StoreItem.create!(store_id: store_1.id, item_id: item_4.id, price: Faker::Commerce.price)
#   store_2_item_1 = StoreItem.create!(store_id: store_2.id, item_id: item_1.id, price: Faker::Commerce.price)
#   store_2_item_2 = StoreItem.create!(store_id: store_2.id, item_id: item_2.id, price: Faker::Commerce.price)
#   store_2_item_3 = StoreItem.create!(store_id: store_2.id, item_id: item_3.id, price: Faker::Commerce.price)
#   store_2_item_4 = StoreItem.create!(store_id: store_2.id, item_id: item_4.id, price: Faker::Commerce.price)
#   store_3_item_4 = StoreItem.create!(store_id: store_3.id, item_id: item_4.id, price: Faker::Commerce.price)
#   store_3_item_5 = StoreItem.create!(store_id: store_3.id, item_id: item_5.id, price: Faker::Commerce.price)
#   store_3_item_6 = StoreItem.create!(store_id: store_3.id, item_id: item_6.id, price: Faker::Commerce.price)
#   store_3_item_7 = StoreItem.create!(store_id: store_3.id, item_id: item_7.id, price: Faker::Commerce.price)

#   user_store_1_item_1 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_1_item_1.id)
#   user_store_1_item_2 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_1_item_2.id)
#   user_store_1_item_3 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_1_item_3.id)
#   user_store_1_item_4 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_1_item_4.id)
#   user_store_2_item_1 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_2_item_1.id)
#   user_store_2_item_2 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_2_item_2.id)
#   user_store_2_item_3 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_2_item_3.id)
#   user_store_2_item_4 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_2_item_4.id)
#   user_store_3_item_4 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_3_item_4.id)
#   user_store_3_item_5 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_3_item_5.id)
#   user_store_3_item_6 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_3_item_6.id)
#   user_store_3_item_7 = UserStoreItem.create!(user_id: the_only_user.id, store_item_id: store_3_item_7.id)

# # More seeds to play with
# user = User.create(email: Faker::Internet.email)

# store1 = user.stores.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address, zipcode: "12345")
# store2 = user.stores.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address, zipcode: "12345")
# store3 = user.stores.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address, zipcode: "12345")

# item1 = Item.create(name: Faker::Food.ingredient, photo_url: Faker::Internet.url)
# item2 = Item.create(name: Faker::Food.ingredient, photo_url: Faker::Internet.url)
# item3 = Item.create(name: Faker::Food.ingredient, photo_url: Faker::Internet.url)

# storeitem1 = StoreItem.create(store_id: store1.id, item_id: item1.id, price: Faker::Commerce.price(range: 0..10.0))
# storeitem2 = StoreItem.create(store_id: store2.id, item_id: item1.id, price: Faker::Commerce.price(range: 0..10.0))
# storeitem3 = StoreItem.create(store_id: store3.id, item_id: item1.id, price: Faker::Commerce.price(range: 0..10.0))
# storeitem4 = StoreItem.create(store_id: store2.id, item_id: item2.id, price: Faker::Commerce.price(range: 0..10.0))
# storeitem5 = StoreItem.create(store_id: store3.id, item_id: item3.id, price: Faker::Commerce.price(range: 0..10.0))

# UserStoreItem.create(user_id: user.id, store_item_id: storeitem1.id, quantity: 2)
# UserStoreItem.create(user_id: user.id, store_item_id: storeitem4.id, quantity: 5)
# UserStoreItem.create(user_id: user.id, store_item_id: storeitem2.id, quantity: 1)









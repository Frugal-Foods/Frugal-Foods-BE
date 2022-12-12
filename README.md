# Description
This is the back-end API for our Frugal Foods application. For for detailed information about the application please visit the [frugal foods front-end repository](https://github.com/Frugal-Foods/frugal-foods-fe).

This app includes a PostgreSQL database that stores users, stores, items, store items, user store items, and user stores information for the app. Store and product information is provided by consumption of both the [Target](https://www.redcircleapi.com/docs/target-product-data-api/overview) and [Kroger] (https://developer.kroger.com/reference/) API's. This app consolidates the data provided by the external API's to be consumed by our front end and served to the end user. This prototype currently has two zipcodes available for demo: '80108' and '80206'.

# Links
[Frugal Foods BE deployment](https://frugal-foods-be.fly.dev/)
[frugal foods front-end repository](https://github.com/Frugal-Foods/frugal-foods-fe)

## Technologies Used
Rails 5.2.8
Ruby 2.7.4
PostgreSQL Database
CircleCI for CI/CD
Fly.io for deployment

## Local setup directions
1) Clone down the repo.
```
git clone git@github.com:Frugal-Foods/Frugal-Foods-BE.git
```
2) Switch your working directory to the root directory.
```
cd Frugal-Foods-BE/
```
(If you have not installed Ruby before, you can follow [this tutorial](https://stackify.com/install-ruby-on-your-mac-everything-you-need-to-get-going/) (for Mac computers).<br>
3) Install bundler if you haven't before.
```
gem install bundler
```
4) Install the project's gem dependencies.
```
bundle install
```
5) Set up the database.
```
rails db:{create,migrate}
```
6) Seed the DB (*prototype version only*).
```
rails json_load:all
```
7) Run the Rails server.
```
rails s
```
Follow the setup instructions for the [frugal foods front-end repository](https://github.com/Frugal-Foods/frugal-foods-fe) in order to make queries to the [frugal foods API](https://frugal-foods-be.fly.dev/).

You can also access queries through Postman by sending a POST request to `localhost:3000/graphql` and sending the query (shown below) in the body of your request.

## Future goals
- Due to rate limiting for free usage of both the Target and Kroger API's, our prototype only includes data from two zipcodes. Our goal moving forward to make this application more dynamic is to make live API calls to return data for any user in any zipcode.
- Implement authentication, allowing a user to create an account and have their popular stores and items remembered
- Implement 'shop by department' feature that allows user to browse all products for a store along with the ability to search for a specific item.
- Collect data for other popular grocery stores to allow the user more options when choosing stores near them.
- Implement 'cheapest in one stop' feature that allows a user to search all items on their grocery list and see which store would have the cheapest total if they only wanted to stop at one store.
- Implement a map feature that creates a route for the user depending on which stores were chosen.

## Endpoints Available
Base URL: `https://frugal-foods-be.fly.dev/` 
All endpoints below can be accessed with POST request to `https://frugal-foods-be.fly.dev/graphql` and the query (below) sent in the request body.<br><br>


## Stores Query
<b>Note:</b> This prototype currently has two zipcodes available for demo: '80108' and '80206'
  ```
  {
  stores(zipcode: "83749") {
    id
    name
    address
  }
}
```
## Expected Response
```JSON
{
    "data": {
        "stores": [
            {
                "id": "1",
                "name": "The Little Clinic - 125 Castle Rock Clinic",
                "address": "5544 Promenade Pkwy, Castle Rock, CO, 80108"
            },
            {
                "id": "2",
                "name": "Loaf 'N Jug",
                "address": "4901 North Castleton Dr., Castle Rock, CO, 80109"
            },
            {
                "id": "3",
                "name": "King Soopers Marketplace - Castle Rock",
                "address": "5544 Promenade Parkway, Castle Rock, CO, 80108"
            },
            {
                "id": "4",
                "name": "King Soopers - Castle Rock",
                "address": "7284 Lagae Rd, Castle Pines, CO, 80108"
            },
            {
                "id": "5",
                "name": "King Soopers - Castle Rock",
                "address": "750 N Ridge Rd, Castle Rock, CO, 80104"
            },
            {
                "id": "6",
                "name": "The Little Clinic - 075 Parker Clinic",
                "address": "12959 S Parker Rd, Parker, CO, 80134"
            },
            {
                "id": "7",
                "name": "King Soopers - Parker",
                "address": "12959 S Parker Rd, Parker, CO, 80134"
            },
            {
                "id": "8",
                "name": "King Soopers - Highlands Ranch",
                "address": "4000 Red Cedar Dr, Highlands Ranch, CO, 80126"
            },
            {
                "id": "9",
                "name": "King Soopers - Parker",
                "address": "17031 Lincoln Ave, Parker, CO, 80134"
            },
            {
                "id": "10",
                "name": "King Soopers - VILLAGE CENTER",
                "address": "9551 S University Blvd, Highlands Ranch, CO, 80126"
            }
        ]
    }
}
```

## GET Stores Items 
```
query storeItems {
  items(search: "boar", userId: 1) {
    	userId
      itemName
      itemId
      photoUrl
      storeName
      price
      storeItemId
      storeId
  }
}

```
## Expected Return
```JSON
{
  "data": {
    "items": [
      {
        "userId": 1,
        "itemName": "Organic Banana",
        "itemId": "323",
        "photoUrl": "https://www.kroger.com/product/images/small/front/0000000094011",
        "storeName": "King Soopers Marketplace - Castle Rock",
        "price": 0.69,
        "storeItemId": "1718",
        "storeId": "1"
      },
      {
        "userId": 1,
        "itemName": "Organic Banana",
        "itemId": "323",
        "photoUrl": "https://www.kroger.com/product/images/small/front/0000000094011",
        "storeName": "King Soopers - Castle Rock",
        "price": 0.69,
        "storeItemId": "1768",
        "storeId": "2"
      }
    ]
  }
}

```

## Get UserStoreItems (a User's final shopping list)
```
{
  userStoreItems(userId: id) {
    storeId
    name
    address
    storeTotalPrice
    listItems {
      itemId
      itemName
      itemPhotoUrl
      price
      quantity
      itemTotal
      storeItemId
      userStoreItemId
    }
  }
}
```
## Expected return

```JSON
{
  "data": {
    "userStoreItems": [
      {
        "storeId": 1,
        "name": "King Soopers Marketplace - Castle Rock",
        "address": "5544 Promenade Parkway, Castle Rock, CO, 80108",
        "storeTotalPrice": 0,
        "listItems": []
      },
      {
        "storeId": 7,
        "name": "Target",
        "address": "5010 Founders Pkwy, Castle Rock, CO, 80108",
        "storeTotalPrice": 1024.66,
        "listItems": [
          {
            "itemId": 1,
            "itemName": "Ocean Spray Jellied Cranberry Sauce - 14oz",
            "itemPhotoUrl": "https://target.scene7.com/is/image/Target/GUEST_3b1f8b32-1532-4df8-be7b-4ba3b3acf2aa",
            "price": 2.19,
            "quantity": 4,
            "itemTotal": 8.76,
            "storeItemId": 1,
            "userStoreItemId": 1
          },
          {
            "itemId": 2,
            "itemName": "Aquafina Pure Unflavored Water - 24pk/16.9 fl oz Bottles",
            "itemPhotoUrl": "https://target.scene7.com/is/image/Target/GUEST_65a11503-43e2-49aa-9a8d-d21e727e9af0",
            "price": 2,
            "quantity": 8,
            "itemTotal": 16,
            "storeItemId": 1975,
            "userStoreItemId": 6
          },
          {
            "itemId": 329,
            "itemName": "Kroger® Brand Broccoli Florets",
            "itemPhotoUrl": "https://www.kroger.com/product/images/large/front/0001111060319",
            "price": 99.99,
            "quantity": 9,
            "itemTotal": 899.91,
            "storeItemId": 1976,
            "userStoreItemId": 7
          },
          {
            "itemId": 329,
            "itemName": "Kroger® Brand Broccoli Florets",
            "itemPhotoUrl": "https://www.kroger.com/product/images/large/front/0001111060319",
            "price": 99.99,
            "quantity": 1,
            "itemTotal": 99.99,
            "storeItemId": 1976,
            "userStoreItemId": 8
          }
        ]
      }
    ]
  }
}
```

# Get UserStore
```
query {
  userStores(userId: 1) {
    id
    storeId
    userId
  }
}
```

## Expected Response
```JSON
{
  "data": {
    "userStores": [
      {
        "id": "1",
        "storeId": "1",
        "userId": 1
      },
      {
        "id": "2",
        "storeId": "2",
        "userId": 1
      }
    ]
  }
}
```
​
# Create UserStore (When a user selects a store)
```
mutation {
  createUserStore(input: {userId: 1, storeId: 1}) {
    userStore {
      id
      userId
      storeId
    }
    errors
  }
}
```
​
## Expected Response
```JSON
{
  "data": {
    "createUserStore": {
      "userStore": {
        "id": "4",
        "userId": 1,
        "storeId": 1
      },
      "errors": []
    }
  }
}
```
# Delete AllUserStores (When a User returns to home)
```
mutation {
  destroyAllUserStores(input: {userId: "1"}) {
    userId
  }
}
```

## Expected Response
```JSON
{
  "data": {
    "destroyAllUserStores": {
      "userId": "[]"
    }
  }
}
```
​
# Create UserStoreItem (When a user adds an item to their list)
```
mutation {
  createUserStoreItem(input: {userId: 1, storeItemId: 1, quantity: 4}) {
    userStoreItem {
      id
      userId
      storeItemId
      quantity
    }
    errors
  }
}
```
## Expected response
```JSON
{
  "data": {
    "createUserStoreItem": {
      "userStoreItem": {
        "id": "1",
        "userId": 1,
        "storeItemId": 1,
        "quantity": 4
      },
      "errors": []
    }
  }
}
```
# DELETE UserStoreItem
```
mutation{
	destroyUserStoreItem(input:
  { id:"13"}) {
	  id
  }
}

```
## Example Response
```JSON
{
  "data": {
    "destroyUserStoreItem": {
      "id": "13"
    }
  }
}
```
# Delete UserStore

```
mutation{
	destroyUserStore(input:
  { id:"13"}) {
	  id
  }
}
```

## Example Response
```JSON
{
  "data": {
    "destroyUserStore": {
      "id": "13"
    }
  }
}
```

# PATCH UserStoreItem
```
mutation{
  updateUserStoreItem(input:{
    id: "16",
    quantity: 11
      }) {
        id
        quantity
    }
  }
```

## Example Response
```JSON

{
  "data": {
    "updateUserStoreItem": {
      "id": "16",
      "quantity": 11
    }
  }
}
```

## BE Local Setup
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
At this point, you can run the front-end application (put link to FE set-up instructions here) and it can make queries to the Rails server at `localhost:3000/graphql`.

You can also access queries through Postman by using a POST request to `localhost:3000/graphql` and sending the request (seen below) in the body of your request.
### Deployed Application
The link for the deployed API is located at: https://frugal-foods-be.fly.dev/. All endpoints below can be accessed with POST request to `https://frugal-foods-be.fly.dev/graphql` and the query (below) sent in the request body.<br><br>


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
```
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
  items(search: "bananas") {
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
```
{
  "data": {
    "items": [
      {
        "itemName": "bananas",
        "itemId": "1",
        "photoUrl": "http://quigley.info/heath_bashirian",
        "storeName": "Target",
        "price": 29.95,
        "storeItemId": "1",
        "storeId": "1"
      },
      {
        "itemName": "bananas",
        "itemId": "1",
        "photoUrl": "http://quigley.info/heath_bashirian",
        "storeName": "Kroger",
        "price": 7.04,
        "storeItemId": "5",
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
      id
      itemName
      itemPhotoUrl
      price
      quantity
      itemTotal
    }
  }
}
```
## Expected return

```
{
  "data": {
    "userStoreItems": [
      {
        "storeId": 1,
        "name": "Walmart",
        "address": "Suite 744 46455 Wilderman Spurs, Hammesfurt, GA 52267",
        "storeTotalPrice": 17.8,
        "listItems": [
          {
            "id": "1",
            "itemName": "Cloves",
            "itemPhotoUrl": "http://schowalter-abbott.info/gabriel",
            "price": 8.9,
            "quantity": 2,
            "itemTotal": 17.8
          }
        ]
      },
      {
        "storeId": 2,
        "name": "Dollar General",
        "address": "Apt. 952 19860 Wisozk Ports, West Mellieside, WV 81121",
        "storeTotalPrice": 27.43,
        "listItems": [
          {
            "id": "4",
            "itemName": "Starfruit",
            "itemPhotoUrl": "http://bogan.io/collene_champlin",
            "price": 4.68,
            "quantity": 5,
            "itemTotal": 23.4
          },
          {
            "id": "2",
            "itemName": "Cloves",
            "itemPhotoUrl": "http://schowalter-abbott.info/gabriel",
            "price": 4.03,
            "quantity": 1,
            "itemTotal": 4.03
          }
        ]
      },
      {
        "storeId": 3,
        "name": "Amazon",
        "address": "92710 Hessel Flat, Lonaville, OK 57954-0845",
        "storeTotalPrice": 0,
        "listItems": []
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
```
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
​
# Create UserStoreItem (When a user adds an item to their list)
```
mutation {
  createUserStoreItem(input: {userId: 1, storeItemId: 1, quantity: 4}) {
    userStoreItem {
      id
      userId
      storeItemId
    }
    errors
  }
}
```
## Expected response
```
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

{
  "data": {
    "destroyUserStoreItem": {
      "id": "13"
    }
  }
}
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

{
  "data": {
    "destroyUserStore": {
      "id": "13"
    }
  }
}

# PATCH UserStoreItem
```
mutation { #attributes are optional - you can choose one or the other or both.
  userStoreItem: updateUserStoreItem(input: {id: 1, storeId: 1, quantity: 3}) {
    id
    storeId
    storeName
    quantity
  }
}
```

## Example Response

tbd


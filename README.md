## Stores Query
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

## Stores Items 
```
{
  storeItems(search: "bananas") {
    id - comes from store items table
    price - comes from store items table
    storeId - comes from stores table
    itemName - comes from item table and store items table (joins)
    storeName #comes from stores table & store items table (joins)
    photoUrl - comes from item table & store_item table (joins)
    itemId
  }
}
```
## Expected Return - will need to change this later after we do query above
```
{
  "data": {
    "stores": [
      {
        "id": "1",
        "name": "Jast, Upton and Barrows",
        "items": [
          {
            "id": "1",
            "name": "Sleek Linen Hat"
          },
          {
            "id": "2",
            "name": "Durable Aluminum Coat"
          },
          {
            "id": "3",
            "name": "Lightweight Plastic Wallet"
          },
          {
            "id": "4",
            "name": "Intelligent Paper Lamp"
          }
        ]
      },
      {
        "id": "2",
        "name": "Sauer-Stoltenberg",
        "items": [
          {
            "id": "1",
            "name": "Sleek Linen Hat"
          },
          {
            "id": "2",
            "name": "Durable Aluminum Coat"
          },
          {
            "id": "3",
            "name": "Lightweight Plastic Wallet"
          },
          {
            "id": "4",
            "name": "Intelligent Paper Lamp"
          }
        ]
      },
      {
        "id": "3",
        "name": "Thompson, Harber and Braun",
        "items": [
          {
            "id": "4",
            "name": "Intelligent Paper Lamp"
          },
          {
            "id": "5",
            "name": "Durable Steel Chair"
          },
          {
            "id": "6",
            "name": "Durable Plastic Gloves"
          },
          {
            "id": "7",
            "name": "Practical Copper Lamp"
          }
        ]
      },
      {
        "id": "4",
        "name": "Carroll Group",
        "items": []
      },
      {
        "id": "5",
        "name": "Ryan-Anderson",
        "items": []
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
mutation {
  userStoreItem: deleteUserStoreItem(input: 
    {id: 1}) {
      id
    }
  }

```
## Example Response


# Delete UserStore
```

mutation {
  userStore: deleteUserStore(input: 
    {id: 1}) {
      id
    }
  }
```

## Example Response

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


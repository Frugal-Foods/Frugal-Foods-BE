## Stores Query
  ```
  {
  stores(zipcode: "83749") {
    id
    name
    address
    createdAt
    updatedAt
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
        "name": "Jast, Upton and Barrows",
        "address": "Suite 456 823 Patricia Garden, East Corrina, CT 64693",
        "createdAt": "2022-12-03T19:13:05Z",
        "updatedAt": "2022-12-03T19:13:05Z"
      },
      {
        "id": "2",
        "name": "Sauer-Stoltenberg",
        "address": "935 Hamill Freeway, Lake Tyishachester, ID 94653",
        "createdAt": "2022-12-03T19:13:05Z",
        "updatedAt": "2022-12-03T19:13:05Z"
      },
      {
        "id": "3",
        "name": "Thompson, Harber and Braun",
        "address": "Apt. 975 8157 Carmelo Stream, Port Willis, AR 20248",
        "createdAt": "2022-12-03T19:13:05Z",
        "updatedAt": "2022-12-03T19:13:05Z"
      },
      {
        "id": "4",
        "name": "Carroll Group",
        "address": "Suite 553 379 Tyron Forest, East Charlott, AK 68271",
        "createdAt": "2022-12-03T19:13:05Z",
        "updatedAt": "2022-12-03T19:13:05Z"
      },
      {
        "id": "5",
        "name": "Ryan-Anderson",
        "address": "16435 O'Hara Gardens, Boyerview, LA 07350",
        "createdAt": "2022-12-03T19:13:05Z",
        "updatedAt": "2022-12-03T19:13:05Z"
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
    #ask FE if they need the item id
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

## User Store Items
```
{
  userStoreItems(user: id) {
    stores {
      id
      name
      address
      storeItems {
        id
        price
        itemName
        photoUrl
        itemQuantity
      }
      totalPrice #at one particular store
    }
    totalPrice #your total price for all stores and all items
  }
}
```
## Expected return - this is not accurate at the moment - need to change after we find the query above

```
{
  "data": {
    "users": [
      {
        "id": "1",
        "email": "casie@bailey.biz",
        "stores": [
          {
            "id": "1",
            "name": "Jast, Upton and Barrows",
            "address": "Suite 456 823 Patricia Garden, East Corrina, CT 64693",
            "storeItems": [
              {
                "id": "1",
                "price": 41.67
              },
              {
                "id": "2",
                "price": 80.41
              },
              {
                "id": "3",
                "price": 3.32
              },
              {
                "id": "4",
                "price": 11.95
              }
            ]
          },
          {
            "id": "2",
            "name": "Sauer-Stoltenberg",
            "address": "935 Hamill Freeway, Lake Tyishachester, ID 94653",
            "storeItems": [
              {
                "id": "5",
                "price": 5.26
              },
              {
                "id": "6",
                "price": 13.81
              },
              {
                "id": "7",
                "price": 20.14
              },
              {
                "id": "8",
                "price": 79.5
              }
            ]
          },
          {
            "id": "3",
            "name": "Thompson, Harber and Braun",
            "address": "Apt. 975 8157 Carmelo Stream, Port Willis, AR 20248",
            "storeItems": [
              {
                "id": "9",
                "price": 67.85
              },
              {
                "id": "10",
                "price": 22.39
              },
              {
                "id": "11",
                "price": 98.89
              },
              {
                "id": "12",
                "price": 7.16
              }
            ]
          },
          {
            "id": "12",
            "price": 7.16
          }
        ]
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
  createUserStoreItem(input: {userId: 1, storeItemId: 1}) {
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
        "id": "2",
        "userId": 1,
        "storeItemId": 1
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
mutation {
  userStoreItem: updateUserStoreItem(input:
  {id: 1, storeId: 1}) {
    id
    storeId
    storeName
  }
}
```

## Example Response


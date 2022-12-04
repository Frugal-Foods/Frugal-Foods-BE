Things you may want to cover:
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
        "name": "Paucek LLC",
        "address": "6301 Mayert Lock, North Cole, AR 41675-4920",
        "createdAt": "2022-12-04T17:16:38Z",
        "updatedAt": "2022-12-04T17:16:38Z"
      },
      {
        "id": "2",
        "name": "Larkin and Sons",
        "address": "20437 Sharilyn Glen, Lake Greta, LA 88627",
        "createdAt": "2022-12-04T17:16:38Z",
        "updatedAt": "2022-12-04T17:16:38Z"
      },
      {
        "id": "3",
        "name": "Cremin-Crona",
        "address": "Suite 536 4517 Bednar Orchard, Port Napoleonland, LA 60174",
        "createdAt": "2022-12-04T17:16:38Z",
        "updatedAt": "2022-12-04T17:16:38Z"
      },
      {
        "id": "4",
        "name": "Feest, Bernier and Dooley",
        "address": "6153 Ortiz Corner, Virgilioton, SC 96473-6981",
        "createdAt": "2022-12-04T17:16:38Z",
        "updatedAt": "2022-12-04T17:16:38Z"
      },
      {
        "id": "5",
        "name": "Franecki Inc",
        "address": "26292 Heathcote Ports, Emiliabury, ND 86652",
        "createdAt": "2022-12-04T17:16:38Z",
        "updatedAt": "2022-12-04T17:16:38Z"
      }
    ]
  }
}
```
## Expected Return
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
## Store Items #sort by price on BE
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
## Expected return for store items
```
#fill this with json response after making query work
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
## Expected return - edit this later once we have our query built  - something like below.

```
{
  "data": {
        "stores": [
          {
            "id": "1",
            "name": "Jast, Upton and Barrows",
            "address": "Suite 456 823 Patricia Garden, East Corrina, CT 64693",
            "storeItems": [
              {
                "id": "1",
                "price": 41.67
                "itemName: "here does the name"
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


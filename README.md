## Schema: 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
## Stores Query
  ```
  {
  stores {
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
  stores {
    id
    name
    items {
      id
      name
    }
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


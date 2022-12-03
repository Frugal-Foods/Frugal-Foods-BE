## To query for users
 ``` 
{
  users {
    id
    email
  }
}
  ``` 
##Expected Response
 ``` 
{
  "data": {
    "users": [
      {
        "id": "1",
        "email": "casie@bailey.biz"
      }
    ]
  }
}
  ``` 

## To query for items
 ``` 
{
  items {
    id
    name
    photoUrl
  }
}
  ``` 
##Expected Response
 ``` 
{
  "data": {
    "items": [
      {
        "id": "1",
        "name": "Sleek Linen Hat",
        "photoUrl": "http://kub.co/willard"
      },
      {
        "id": "2",
        "name": "Durable Aluminum Coat",
        "photoUrl": "http://kuhn-schuster.io/francesco_mccullough"
      },
      {
        "id": "3",
        "name": "Lightweight Plastic Wallet",
        "photoUrl": "http://tillman-schaden.io/hildegarde"
      },
      {
        "id": "4",
        "name": "Intelligent Paper Lamp",
        "photoUrl": "http://berge-leuschke.biz/reid.jones"
      },
      {
        "id": "5",
        "name": "Durable Steel Chair",
        "photoUrl": "http://funk.co/salome_huel"
      },
      {
        "id": "6",
        "name": "Durable Plastic Gloves",
        "photoUrl": "http://sawayn.biz/noriko"
      },
      {
        "id": "7",
        "name": "Practical Copper Lamp",
        "photoUrl": "http://heathcote.com/cassy"
      }
    ]
  }
}
  ``` 

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


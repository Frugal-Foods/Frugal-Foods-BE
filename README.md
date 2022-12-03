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



# ocd_ysers
**Registration** <br>
Send a post request in json format <br>
```
{
    "username": " ",
    "email": " ",
    "password": " " 
}
```
This will return data in format :
```
{
    "user": {
        "id": 6,
        "username": "aman",
        "email": "aman@gmail.com"
    },
    "token": "c48872ae36972c5bbd59684c72788105b9c83f50b4f46b1cff6fa18e6e737091"
}
```
***
**Login** <br>
Send a post request in json format
```
{
    "username":"",
    "password":""
}
```  
This will return data in format:
```
{
    "expiry": "2020-12-05T04:32:49.391286Z",
    "token": "faa91ac21cf639301c9b203925eec41cac0ccf48ba03399d96b86fd471d43e63"
}
```
***
**Logout**


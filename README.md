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
*username*: 150 characters or fewer. Letters, digits and @/./+/-/_ only. <br>

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
Error:<br>
*Existing Username*
```
{
    "username": [
        "A user with that username already exists."
    ]
}
```
*Incorrect Username Format*
```
{
    "username": [
        "Enter a valid username. This value may contain only letters, numbers, and @/./+/-/_ characters."
    ]
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
*Incorrect Credentials:*
```
{
    "non_field_errors": [
        "Unable to log in with provided credentials."
    ]
}
```
***
**Logout**<br>
*This will logout only the given token of user*
Send a post request with header
```
Authorization: Token faa91ac21cf639301c9b203925eec41cac0ccf48ba03399d96b86fd471d43e63
```
If provided token is correct then nothing will be returned.<br>
Otherwise if incorrect token is given (which include tokens which are logged out earlier):-
```
{"detail":"Invalid token."}
```
If no token is provided:-
```
{"detail":"Authentication credentials were not provided."}
```
***
**LogoutAll**<br>
*This will logout all the tokens related to the user associated with given token*
<br> All other detail are same as Logout<br>




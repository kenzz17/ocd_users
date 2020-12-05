# ocd_ysers
<br>
    Hosted at: http://52.187.32.163:8000/
    <br> Admin Login http://52.187.32.163:8000/admin/
<br>

**Registration** <br>
http://52.187.32.163:8000/api/register/
<br>
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
http://52.187.32.163:8000/api/login/
<br>
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
# <a name="logout"></a> 
**Logout**<br>
http://52.187.32.163:8000/api/logout/
<br>
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
http://52.187.32.163:8000/api/logoutall/
<br>
*This will logout all the tokens related to the user associated with given token*
<br> All other detail are same as [Logout](#logout)
<br>
***

**Change Passowrd** <br>
http://52.187.32.163:8000/api/paschange/
<br>
send a post request with header containing authorization token and data (old_password, new_password) <br>
Example (this example is for bash, find corresponding code for angular)<nr>
```
curl -X POST -H 'Authorization: Token 37746eaf3d28908b1997d32788f67e70677c57bf07eb063cd9a8c64878261b98' -d "old_password=test@12345&new_password=new@12345" http://52.187.32.163:8000/api/paschange/  
```
Return data :
```
{
    'status': 'success',
    'code':status.HTTP_200_OK,
    'message':'Password Updated Succesfully',
    'data':[]
}
```

Errors<br>
If old password is worng 
```
{"old_password":["Wrong password"]}
```
***
**Save a New File**<br>
http://52.187.32.163:8000/api/files/ <br>
Send a post request, it should also contain Authentication Token as a Header:-
```
{
    name=""
    lang=""
    body=""
}
```
Example (in bash):-
```
curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw3.cpp&lang=cpp&body=gsgbsgbsg" http://52.187.32.163:8000/api/upload/
```
Output (if file name is new):-
```
{"status":"success","message":"qw7.cpp uploaded succesfully"}
```
*File Name already exists*
```
{"status":"success","message":"qw4.cpp updated succesfully"}
```
Errors:- <br>
*Max Number of File Reached*
```
{"error":"Max File Limit exceeded"}
```
***
**Get Uploaded Files**<br>
http://52.187.32.163:8000/api/files/
<br>
send a GET Request at above link <br>
Input Format:-
```
all:true/false
name:<filename>
```
Example:-
```
curl -X GET -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "all=false&name=qw.cpp" http://52.187.32.163:8000/api/files/
```
If all is true it will return list of all files. Otherwise it will return content of give file.
<br>
if all is false and give filename does not exist then error:-
```
{"error":"file does not exist"}
```
***
**Delete a File**<br>
http://52.187.32.163:8000/api/files/
<br>Send a delete request at above address<br>
Input Format :-
```
all:true/false
name:<filename>
```
Example:-
```
curl -X DELETE -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "all=true&name=qw.cpp" http://52.187.32.163:8000/api/files/
```
If all is true then all the files of given user will be deleted<br> 
If file name does not exist then it will not show any error.<br>
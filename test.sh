# curl -X POST -H 'Authorization: Token 37746eaf3d28908b1997d32788f67e70677c57bf07eb063cd9a8c64878261b98' -d "oldd_password=test@12345&new_password=new@12345" http://127.0.0.1:8000/api/paschange/  
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw3.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw4.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw5.cpp&lang=cpp&body=changed value" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw6.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw7.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw8.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw9.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw10.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw11.cpp&lang=cpp&body=changed figure" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=q12.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X GET -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "all=true&name=qw.cpp" http://127.0.0.1:8000/api/files/
# curl -X DELETE -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "all=true&name=qw.cpp" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw8&projectname=abc&relpath=uuj&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw9&projectname=abc&relpath=uuj&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
# curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw8&projectname=abc&relpath=uuj&lang=cpp&body=new body" http://127.0.0.1:8000/api/projects/
echo 1
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw10&projectname=abc2&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 2
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw10&projectname=abc3&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 3
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw10&projectname=abc4&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 4
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw10&projectname=abc5&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 5
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw10&projectname=abc6&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 6
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw11&projectname=abc7&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 7
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw12&projectname=abc2&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 8
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw13&projectname=abc2&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 9
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw14&projectname=abc2&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 10
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw15&projectname=abc2&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 11
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw16&projectname=abc2&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 12
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw17&projectname=abc2&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 13
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw18&projectname=abc2&relpath=&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 14
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw19&projectname=abc2&relpath=jhagj/jhq&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/
echo 15
curl -X POST -H 'Authorization: Token 05933faab6e52ce26035ff5aeb6f9f270b60f69364f25c37173a2effc455bf2c' -d "name=qw20&projectname=abc2&relpath=kaenk/uwhdg&lang=cpp&body=newbody" http://127.0.0.1:8000/api/projects/

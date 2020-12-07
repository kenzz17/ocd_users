# curl -X POST -H 'Authorization: Token 37746eaf3d28908b1997d32788f67e70677c57bf07eb063cd9a8c64878261b98' -d "oldd_password=test@12345&new_password=new@12345" http://52.187.32.163:8000/api/paschange/  
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw3.cpp&lang=cpp&body=gsgbsgbsg" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw4.cpp&lang=cpp&body=gsgbsgbsg" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw5.cpp&lang=cpp&body=changed value" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw6.cpp&lang=cpp&body=gsgbsgbsg" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw7.cpp&lang=cpp&body=gsgbsgbsg" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw8.cpp&lang=cpp&body=gsgbsgbsg" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw9.cpp&lang=cpp&body=gsgbsgbsg" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw10.cpp&lang=cpp&body=gsgbsgbsg" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw11.cpp&lang=cpp&body=changed figure" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=q12.cpp&lang=cpp&body=gsgbsgbsg" http://52.187.32.163:8000/api/files/
# echo
# curl -X GET -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "all=True&name=qw.cpp" http://52.187.32.163:8000/api/files/
# echo
curl -X GET -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef'  http://127.0.0.1:8000/api/files/?all=True&name=qw.cpp
# echo
# curl -X DELETE -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "all=true&name=qw.cpp" http://52.187.32.163:8000/api/files/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw8&projectname=abc&relpath=uuj&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw9&projectname=abc&relpath=uuj&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw8&projectname=abc&relpath=uuj&lang=cpp&body=new body" http://52.187.32.163:8000/api/projects/
# echo 1
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw10&projectname=abc2&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 2
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw10&projectname=abc3&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 3
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw10&projectname=abc4&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 4
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw10&projectname=abc5&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 5
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw10&projectname=abc6&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 6
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw11&projectname=abc7&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 7
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw12&projectname=abc2&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 8
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw13&projectname=abc2&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 9
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw14&projectname=abc2&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 10
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw15&projectname=abc2&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 11
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw16&projectname=abc2&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 12
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw17&projectname=abc2&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 13
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw18&projectname=abc2&relpath=&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 14
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw19&projectname=abc2&relpath=jhagj/jhq&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 15
# curl -X POST -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "name=qw20&projectname=abc2&relpath=kaenk/uwhdg&lang=cpp&body=newbody" http://52.187.32.163:8000/api/projects/
# echo 16
# curl -X GET -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "all=true&name=abc2" http://52.187.32.163:8000/api/projects/
# echo 17
# curl -X DELETE -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "all=false&projectname=abc2&filename=qw12" http://52.187.32.163:8000/api/projects/
# echo 18
# curl -X DELETE -H 'Authorization: Token bde10685642e99a939db28f78bdc9f83ff67905b5be1f2e7332800702465baef' -d "all=true&projectname=abc2&filename=qw12" http://52.187.32.163:8000/api/projects/



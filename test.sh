# curl -X POST -H 'Authorization: Token 37746eaf3d28908b1997d32788f67e70677c57bf07eb063cd9a8c64878261b98' -d "oldd_password=test@12345&new_password=new@12345" http://127.0.0.1:8000/api/paschange/  
# curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw3.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw4.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw5.cpp&lang=cpp&body=changed value" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw6.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw7.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw8.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw9.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw10.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=qw11.cpp&lang=cpp&body=changed figure" http://127.0.0.1:8000/api/files/
# curl -X POST -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "name=q12.cpp&lang=cpp&body=gsgbsgbsg" http://127.0.0.1:8000/api/files/
curl -X GET -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "all=true&name=qw.cpp" http://127.0.0.1:8000/api/files/
# curl -X DELETE -H 'Authorization: Token 3cdc5be20ba73d4dfdf9849b89f606e1b3fe5656a3726929b2adc7aee495f9eb' -d "all=true&name=qw.cpp" http://127.0.0.1:8000/api/files/

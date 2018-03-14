# DockerNginxLocalProxy

As a developer you probably used to work on multiple project, most of them comes with docker containers. In order to work simultaneously, you may map them in different port.

This repository indends to give you the flexibility to access multiple project without remembering the ports with the power of Nginx Reverse Proxy. 

Imagine your name is John Doe, and your computer's hostname is jhondoe.lo
You are currently contributing in two different projects, one is NodeJs another is Django. 

You probably run NodeJs project with :
````
docker run  \
	-d \
	--name "node_api" \
	-p 5000:5000 \
	-e "APP=index.js" \
	-e "NODE_ENV=development" \
	-v $(pwd)/api:/var/www/example.com/api \
	johndoe/nodejs;
`````
You may run Django App with something like : 
````
docker run \
    -d \
    --name django_app \
    -p 8000:8000 \
    -v $(pwd)/app:/var/www/example.com/app \
    johndoe/django;
````

If that's the case, I assume you are accessing your project 

NodeJs : http://jhondoe.lo:5000 \
Django : http://jhondoe.lo:8000


This repository gives you the ability to cut the complexity of port and access projects as following : 

NodeJs : http://node.jhondoe.lo \
Django : http://django.jhondoe.lo
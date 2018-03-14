# DockerNginxLocalProxy

As a developer you probably used to work on multiple project, most of them comes with docker containers. In order to work simultaneously, you may map them in different port.

This repository indends to give you the flexibility to access multiple project without remembering the ports with the power of Nginx Reverse Proxy and Docker. [See better explantation](https://github.com/timam/DockerNginxLocalProxy/blob/master/BetterExplanation.md)


### How to use?

At this point, you will need three information to use this repository. I will automate things soon.

-   Your Private IP
-   Your desired local domain/hostname
-   Port - That you want to porxy

Once you have those information, first prepare configuration as needed. 

````
$ sudo ./prepare_conf.sh
````

Once you have necessary configuration ready, create your nginx_proxy docker image.
````
$ docker-compose build 
````

You have everythig you need. Let compose make it up for you in detachad mode. 
````
$ docker-compose up -d
````
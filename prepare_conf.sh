#!/bin/bash
take_backup(){
    #Creating backup of /etc/hosts file
    cat /etc/hosts > hosts.backup
}

greetings(){
    printf %100s |tr " " "=" 
    echo $'\n'
    echo $' Thank you for using Local Nginx Docker Proxy \n ' 
#   dialog --title "Hello" --msgbox 'Hello world!' 6 20
    printf %100s |tr " " "=" 
    echo $'\n'
}


write_nginx_header(){
    echo -e 'events {' >> nginx.conf
    echo -e ' \t ' 'worker_connections  1024;' >> nginx.conf
    echo -e '}\n' >> nginx.conf
}

write_nginx_instance(){
    printf 'Enter your desired local domain : '
    read -r domain
    ip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
    printf 'Your local IP address is :'$ip'\n'
    printf 'Enter the Port Number : '
    read -r port 

    echo 'http {' >> nginx.conf
    echo -e ' \t ' 'server {' >> nginx.conf
    echo -e ' \t \t' 'listen       80;' >> nginx.conf
    echo -e ' \t \t' 'server_name' "$domain" ';\n' >> nginx.conf
    echo -e ' \t \t' 'location / {' >> nginx.conf
    echo -e ' \t \t \t' 'proxy_pass http://'"$ip"':'"$port"';' >> nginx.conf
    echo -e ' \t \t' '}' >> nginx.conf
    echo -e ' \t' '}' >> nginx.conf
    echo '}' >> nginx.conf

    #updating hosts file 
    echo -e "$ip"  '\t'   "$domain" >> /etc/hosts
}

thankyou(){
    echo "Thank You! for using Local Nginx Docker Proxy"
}


take_backup
greetings
write_nginx_header
write_nginx_instance
thankyou
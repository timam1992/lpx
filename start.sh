#!/bin/bash
greetings(){
    printf %100s |tr " " "=" 
    echo $'\n'
    echo $' Thank you for using Local Nginx Docker Proxy \n ' 
#   dialog --title "Hello" --msgbox 'Hello world!' 6 20
    printf %100s |tr " " "=" 
    echo $'\n'
}

thankyou(){
    echo "Thank You! for using Local Nginx Docker Proxy"
}
greetings
thankyou
#!/bin/bash

ambiente=("xxxx" "yyyyy" "zzzzzzz")
domain_name='XXXXXXXX/stress'

CLIENTID='XXXXXXXXX'
SECRETID='XXXXXXXXXXXX'
URL='https://XXXXXXX/token'
TOKEN=$(curl -X POST -u "$CLIENTID:$SECRETID" -d "grant_type=client_credentials" $URL | python -c "import sys, json; print json.load(sys.stdin)['access_token']")
# #echo $TOKEN

for amb in ${ambiente[@]}
do
    echo $amb
    endereco="https://$amb.$domain_name"
    #echo $endereco
    result=$(curl -X GET -sL -w "%{http_code}\\n" $endereco -so /dev/null \
         -H "Authorization: Bearer $TOKEN")
    echo $result
    echo "##################" 
    
done

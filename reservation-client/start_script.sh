#!/bin/bash
apt-get update
apt-get install curl -y
while [ true ];
do
        curl --connect-timeout 20 localhost:8888 > /dev/null 2>&1
        if [ "$?" == 0 ]; then
                echo "Config server is available"
                java -jar reservation-client-0.0.1-SNAPSHOT.jar > reservation_client_service.log
        fi
        echo "Config server is not available; waiting for 10s"
        sleep 10
done

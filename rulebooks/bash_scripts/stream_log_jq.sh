#!/bin/bash

tail -Fn0 /home/ec2-user/transfer.log | while read -r line; do
    if [[ "$line" == *"RPM signature valid"* ]]; then
        # jq safely packages the log and hostname into structured JSON
        PAYLOAD=$(jq -n --arg msg "$line" --arg host "$(hostname)" '{message: $msg, host: $host}')

        curl -H "Content-Type: application/json" \
             -d "$PAYLOAD" \
             http://{{ aap_host }}:5050
    fi
done
~           

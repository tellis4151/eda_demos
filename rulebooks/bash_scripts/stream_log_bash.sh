#!/bin/bash

tail -Fn0 /home/ec2-user/transfer.log | while read -r line; do
    if [[ "$line" == *"RPM signature valid"* ]]; then
        # This replaces " with \" dynamically
        escaped_line=${line//\"/\\\"}

        curl -H "Content-Type: application/json" \
             -d "{\"message\": \"$escaped_line\", \"host\": \"$(hostname)\"}" \
             http://{{ aap_host }}:5050
    fi
done

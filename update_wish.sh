#!/bin/bash

# The URL to fetch data from
URL="https://e-invitation.pecatudesign.com/api/v1/get_say/147"

# Use curl to fetch data and store the response
RESPONSE=$(curl -s -w "%{http_code}" -o response.json "$URL")

# Check if the last 3 characters of the response are 200 (HTTP status code)
if [ ${RESPONSE: -3} == "200" ]; then
    # If successful, format the JSON and save it to "says.json"
    jq '.' response.json > "says.json"
    echo "Data fetched successfully and formatted in 'says.json'"
    # Optionally, remove the unformatted response file
    rm response.json
else
    echo "Failed to fetch data. HTTP Status: ${RESPONSE: -3}"
    # Optionally, you can remove the response.json file if the request failed
    rm response.json
fi

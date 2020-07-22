#!/bin/bash

# This script adds users from OKTA1 group into OKTA2 group.
OKTA1_api_token=XXXXXXXXXXXXXXXX
OKTA2_api_token=XXXXXXXXXXXXXXXX

# Read parameters for the IDs of OKTA1 group and OKTA2 group
OKTA1_GROUP=$1
OKTA2_GROUP=$2

# Send an Okta API GET request to get all the users from the OKTA1 group and save to JSON.
curl -v -X GET \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${OKTA1_api_token}" \
"https://OKTA1-TENANT.okta.com/api/v1/groups/${OKTA1_GROUP}/users" >> OKTA1_users_in_group.json

# Parse the JSON output and return a csv file with each user's email per line delimited by a comma
cat OKTA1_users_in_group.json | jq '.[].profile.email' | sed 's/^"//' | sed 's/"$/,/' > OTKA1_emails_in_group.csv

# Feed the emails one by one to the Okta API GET request and obtain each user's data from the OKTA2 side
while IFS=, read -r email
do
    curl -v -X GET \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: SSWS ${OKTA2_api_token}" \
    "https://OKTA2-TENANT.okta.com/api/v1/users?q=${email}" >> OKTA2_user_data.txt
    echo "" >> OKTA2_user_data.txt
done < OTKA1_emails_in_group.csv

# grab only the UID from each line of OKTA2_user_data.txt
# add a comma to the end of each line for the CSV to be delimited
cut -c 9-28 OKTA2_user_data.txt | sed 's/$/,/' > OKTA2_uids.csv

# feed the UIDs to the Okta API PUT request and add each UID to the OKTA2 group
while IFS=, read -r uid
do
    curl -v -X PUT \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: SSWS ${OKTA2_api_token}" \
    "https://OKTA2-TENANT.okta.com/api/v1/groups/${OKTA2_GROUP}/users/$uid"
done < OKTA2_uids.csv

# Cleanup
rm *.csv *.txt *.json

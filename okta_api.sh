#!/bin/bash
api_token="XXXXXXXXXXXXXXXXXXX"

# This script adds users from the OKTA1-coretech group into the OKTA2-coretech group.
# emails_in_OKTA1_coretech.csv contains one email per line delimited by a comma of each user in the OKTA1-coretech group.

# feed the emails one by one to the Okta API GET request and obtain each user's data from the OKTA2 side
while IFS=, read -r email
do
    curl -v -X GET \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: SSWS ${api_token}" \
    "https://okta-domain.okta.com/api/v1/users?q=${email}" >> OKTA2_user_data.txt
    echo "" >> OKTA2_user_data.txt
done < emails_in_OKTA1_coretech.csv

# grab only the UID from each line of OKTA2_user_data.txt
# add a comma to the end of each line for the CSV to be delimited
cut -c 9-28 OKTA2_user_data.txt | sed 's/$/,/' > OKTA2_uids.csv

# feed the UIDs to the Okta API PUT request and add each UID to the OKTA2-coretech group 00g1j6yka1aPYWNBj0h8
while IFS=, read -r uid
do
    curl -v -X PUT \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: SSWS ${api_token}" \
    "https://okta-domain.okta.com/api/v1/groups/00g1j6yka1aPYWNBj0h8/users/$uid"
done < OKTA2_uids.csv

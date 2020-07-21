#!/bin/bash
api_token="XXX"

#
# the first script feeds a csv file with 1 email address per line separated by commas into the Okta API to GET the user's Okta ID
#

while IFS=, read -r email
do
    curl -v -X GET \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: SSWS ${api_token}" \
    "https://domain-url.okta.com/api/v1/users?q=${email}" >> output.txt
    echo "" >> output.txt
done < emails.csv

# after extracting the UID from output.txt, add them to uids.csv one line at at time separated by commas
# the second script feeds a csv file with 1 Okta UID per line into the Okta API to PUT each user into a specific group 00g1j6yka1aPYWNBj0h8
#

while IFS=, read -r uid
do
    curl -v -X PUT \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: SSWS ${api_token}" \
    "https://domain-url.okta.com/api/v1/groups/00g1j6yka1aPYWNBj0h8/users/${uid}"
done < uids.csv

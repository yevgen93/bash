curl --request POST \
 --url "https://api.hubapi.com/properties/v1/contacts/properties?hapikey=${APIKEY}" \
 --header 'content-type: application/json' \
 --data '{
 "name": "'"$NAME"'",
 "label": "'"$LABEL"'",
 "description": "'"$DESC"'",
 "groupName": "contactinformation",
 "type": "string",
 "fieldType": "'"$FIELD_TYPE"'",
 "formField": true,
 "displayOrder": 6,
 "options": []
}'


# # Define each array and then add it to the main one
# SUB_0=("eugeneprop" "Eugene Label" "Test Prop for Eugene" "radio")
# SUB_1=("eugeneprop2" "Eugene Label 2" "Test Prop for Eugene 2" "text")
# MAIN_ARRAY=(
#   SUB_0[@]
#   SUB_1[@]
# )

# COUNT=${#MAIN_ARRAY[@]}
# for ((i=0; i<$COUNT; i++))
# do
#   SUBLIST=${!MAIN_ARRAY[i]}
#   set -- $SUBLIST
#   echo $8
#   LABEL=${!MAIN_ARRAY[i]:1:1}
#   DESC=${!MAIN_ARRAY[i]:3:1}
#   FIELD_TYPE=${!MAIN_ARRAY[i]:4:1}
# echo "NAME ${NAME}"
#   echo "VALUE ${VALUE}"
#   echo "DESC ${DESC}"
#   echo "FIELD_TYPE ${FIELD_TYPE}"
# done

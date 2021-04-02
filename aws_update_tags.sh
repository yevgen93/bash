#!/bin/bash

while IFS=, read -r ec2
do
   # aws ec2 create-tags --resources $ec2 --tags Key=Function,Value=Unique-Devices --region us-east-1
    aws ec2 describe-tags --filters Name=resource-id,Values=$ec2 --region us-east-1
done < dmp.csv


# dmp.csv consists of this comma delineated file of ec2 ID:
# i-0cb1068de6670e2e0,
# i-06a5fce41ef32e037,
# i-0ffe2c291107dc9ba,
# i-0f9ca2d153548f508,
# i-08418d9beabf29b09,
# ...

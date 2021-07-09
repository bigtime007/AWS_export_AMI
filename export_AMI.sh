#!/bin/bash
echo "Bucket Name"
read BUCKET_NAME
aws s3 mb $BUCKET_NAME
aws ec2 describe-instances
echo "Input Instace ID Below, format i-xyx1234567890"
read EC2_ID
aws ec2 create-image \
    --instance-id $EC2_ID \
    --name "wg-server" \
    --description "AWS WireGuard Image"

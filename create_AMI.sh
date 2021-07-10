#!/bin/bash
echo "Do You Need a S3 Bucket to Export the AMI (y/n):"
read a
typeset -l n
if [[ $a = y ]]
then
echo "Name S3 Bucket"
read MB_NAME
aws s3 mb s3://$MB_NAME
exit
else
echo "No Bucket Added"
fi
echo "Add These Settings to Your export S3 Bucket"
echo "Edit access control list (ACL) add access to other AWS accounts"
echo "Grantee: c4d8eabf8db69dbe46bfe0e517100c554f01200b104d59cd408e777ba442a322"
echo "Objects: List, Write | Bucket: ACL Read, Write"
echo "Enter (y) when done. Any other key will abort the script"
read b
typeset -l n 
if [[ $b = y ]]
then
echo "All done!"
fi
aws ec2 describe-instances
echo "Input Instace ID Below, format i-xyx1234567890"
read EC2_ID
aws ec2 create-image \
    --instance-id $EC2_ID \
    --name "wg-server" \
    --description "AWS WireGuard Image"
echo "Make Copy AMI ID before exiting screen (y) to exit or locate in AWS Console"
read c
typeset -l n 
if [[ $c = y ]]
then
echo "All done, Run: bash export_AMI.sh"
fi

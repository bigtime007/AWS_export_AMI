#!/bin/bash
echo "----------------------------------------------------------------------------------------------------------"
echo "This Script will help you automate exporting a AMI to a S3 Bucket you created in create_AMI.sh"
echo " This proccess will take some time so make sure your info is entered correctly"
echo "----------------------------------------------------------------------------------------------------------"
echo "Enter image id, Example: ami-12ab34cd56ef78ghxyz"
read AMI_ID
echo "Enter S3 Bucket name w/o s3://"
read S3_BUCKET
echo "S3 Bucket Prefix typically: exports/ (/) not needed"
read S3_Prefix
aws ec2 export-image --image-id $AMI_ID --disk-image-format VMDK --s3-export-location S3Bucket=$S3_BUCKET,S3Prefix=$S3_Prefix/
echo "----------------------------------------------------------------------------------------------------------"


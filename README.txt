# AWS_export_AMI

Ref for IAM policy
https://aws.amazon.com/premiumsupport/knowledge-center/ec2-export-vm-using-import-export/

If EBS encryption by default is on do the following via CLI:
aws ec2 disable-ebs-encryption-by-default
{
    "EbsEncryptionByDefault": false
}
Should be the output.
If you need to enable then again then...
aws ec2 enable-ebs-encryption-by-default

To check the status of your export...
aws ec2 describe-export-image-tasks --export-image-task-id export-ami-id
example: 
"ExportImageTaskId": "export-ami-070d724wf00d3b441"
aws ec2 describe-export-image-tasks --export-image-task-id export-ami-070d724wf00d3b441

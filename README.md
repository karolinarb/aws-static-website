# aws-static-website

cli after creating infrastructure:
aws s3 cp modules/aws-static-website/www/ s3://$(terraform output module_outputs -raw name)/

#
#
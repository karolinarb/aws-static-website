provider "aws" {
    region = "us-west-2"
}

module "aws_static_website" {
  source = "./modules/aws-static-website"

  bucket_name = <unique_bucket_name>

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "module_outputs" {
  value = module.aws_static_website
}

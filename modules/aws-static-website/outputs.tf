output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3_website_bucket.arn
}

output "name" {
  description = "Name or id of the bucket"
  value       = aws_s3_bucket.s3_website_bucket.id
}

output "domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket_website_configuration.s3_website_bucket.website_domain
}
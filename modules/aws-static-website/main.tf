resource "aws_s3_bucket" "s3_website_bucket" {
    bucket = var.bucket_name

    tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "s3_website_bucket" {
    bucket = aws_s3_bucket.s3_website_bucket.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3_website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "read_only" {
  bucket = aws_s3_bucket.s3_website_bucket.id
  policy = data.aws_iam_policy_document.read_only.json
}

data "aws_iam_policy_document" "read_only" {
  statement {

    principals {
        type = "AWS"
        identifiers = ["*"]
    }

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}",
    ]
  }
  statement {

    principals {
        type = "AWS"
        identifiers = ["*"]
    }

    actions = [
        "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
  }
}



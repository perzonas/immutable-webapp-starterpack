provider "aws" {
  version = "~> 2.60"
  region = "eu-north-1"
}

resource "aws_s3_bucket" "first_test_bucket_tf123456789" {
  bucket = "bucket-first-bucket"
  acl = "private"

  tags = {
    Environment = "Dev"
    Managed = "Terraform"

  }
}

resource "aws_s3_bucket" "second_test_bucket_tf123456789" {
  bucket = "bucket-second-bucket"
  acl = "private"

  tags = {
    Environment = "Dev"
    Managed = "Terraform"
  }

}

resource "aws_s3_bucket_policy" "first_policy" {
  bucket = aws_s3_bucket.first_test_bucket_tf123456789.id

  policy = templatefile("${path.module}/policy/public_bucket.json.tpl", {bucket_arn = aws_s3_bucket.first_test_bucket_tf123456789.arn})
}

resource "aws_s3_bucket_policy" "second_policy" {
  bucket = aws_s3_bucket.second_test_bucket_tf123456789.id

  policy = templatefile("${path.module}/policy/public_bucket.json.tpl", {bucket_arn = aws_s3_bucket.second_test_bucket_tf123456789.arn})

}
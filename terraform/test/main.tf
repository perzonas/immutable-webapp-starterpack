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

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1582630604704",
  "Statement": [
    {
      "Sid": "Stmt1582630385628",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": "${arn:aws:s3:::bucket-first-bucket}/*"
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_policy" "second_policy" {
  bucket = aws_s3_bucket.second_test_bucket_tf123456789.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1582630604704",
  "Statement": [
    {
      "Sid": "Stmt1582630385628",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": "${arn:aws:s3:::bucket-second-bucket}/*"
    }
  ]
}
POLICY
}
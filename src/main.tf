provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "react_website" {
  bucket = "vite-react-todo"
  acl = "public-read"
  website {
    index_document = "index.html"
    allowed_bucket_origins = ["*"]
  }

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::vite-react-todo/*"
    }
  ]
}
POLICY
}

output "bucket_url" {
  value = aws_s3_bucket.react_website.website_endpoint
}

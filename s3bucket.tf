# CREATE WORTH ADMIN S3 BUCKET 

resource "aws_s3_bucket" "worthai_worth_admin" {
  bucket = var.s3_admin_bucket

  tags = {
    Name = var.s3_admin_bucket
  }
}


# Add bucket policy allowing access to CloudFront service principal

resource "aws_s3_bucket_policy" "worthai_worth_admin_policy" {
  bucket = aws_s3_bucket.worthai_worth_admin.id

  policy = jsonencode({
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.worthai_worth_admin.arn}/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "arn:aws:cloudfront::786888909921:distribution/${aws_cloudfront_distribution.worthai_worthadmin_cloudfront.id}"
                }
            }
        }
    ]
  })
}

##########################################################################################

# CREATE CUSTOMER ADMIN S3 BUCKET 

resource "aws_s3_bucket" "worthai_customer_admin" {
  bucket = var.s3_customer_bucket

  tags = {
    Name = var.s3_customer_bucket
  }
}


# Add bucket policy allowing access to CloudFront service principal

resource "aws_s3_bucket_policy" "worthai_customer_admin_policy" {
  bucket = aws_s3_bucket.worthai_customer_admin.id

  policy = jsonencode({
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.worthai_customer_admin.arn}/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "arn:aws:cloudfront::786888909921:distribution/${aws_cloudfront_distribution.worthai_customeradmin_cloudfront.id}"
                }
            }
        }
    ]
  })
}

##########################################################################################

# CREATE APPLICANT S3 BUCKET 

resource "aws_s3_bucket" "worthai_applicant" {
  bucket = var.s3_applicant_bucket
  tags = {
    Name = var.s3_applicant_bucket
  }
}

# Add bucket policy allowing access to CloudFront service principal

resource "aws_s3_bucket_policy" "worthai_applicant_policy" {
  bucket = aws_s3_bucket.worthai_applicant.id

  policy = jsonencode({
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.worthai_applicant.arn}/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "arn:aws:cloudfront::786888909921:distribution/${aws_cloudfront_distribution.worthai_applicant_cloudfront.id}"
                }
            }
        }
    ]
  })
}

##########################################################################################

# CREATE ASSETS S3 BUCKET 

resource "aws_s3_bucket" "worthai_assets" {
  bucket = var.s3_assets_bucket

  tags = {
    Name = var.s3_assets_bucket
  }
}

##########################################################################################

# OUTPUT 
output "s3_bucket_name" {
  description = "List of Buckets Created"
  value = [
    aws_s3_bucket.worthai_worth_admin.id,
    aws_s3_bucket.worthai_customer_admin.id,
    aws_s3_bucket.worthai_applicant.id
  ]
}

##########################################################################################
# CREATE WORTH ADMIN CLOUDFRONT DISTRIBUTION 

resource "aws_cloudfront_distribution" "worthai_worthadmin_cloudfront" {
  origin {
    domain_name = aws_s3_bucket.worthai_worth_admin.bucket_regional_domain_name
    origin_id   = "S3-worthai-worth-admin"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    min_ttl                = 86400
    default_ttl            = 86400
    max_ttl                = 86400
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "S3-worthai-worth-admin"
    viewer_protocol_policy = "redirect-to-https"
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  # Define custom error responses
  custom_error_response {
    error_code      = 400
    response_code   = 200
    response_page_path = "/index.html"
    error_caching_min_ttl = 86400
  }

  # Add custom error response for error code 403
  custom_error_response {
    error_code              = 403
    response_code           = 200
    response_page_path      = "/index.html"  
    error_caching_min_ttl   = 86400
  }

  #aliases = ["admin.staging.joinworth.com"]

  viewer_certificate {
    cloudfront_default_certificate = true
    #remove above line and add below one
    #acm_certificate_arn = "arn:aws:acm:region:your-account-id:certificate/your-acm-certificate-arn"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method  = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"  # Allow access from all locations
    }
  }

  # Define the distribution description
  comment = "WorthAI Admin CloudFront Distribution"

}

#########################################################################################

# CREATE CUSTOMER ADMIN CLOUDFRONT DISTRIBUTION 

resource "aws_cloudfront_distribution" "worthai_customeradmin_cloudfront" {
  origin {
    domain_name = aws_s3_bucket.worthai_customer_admin.bucket_regional_domain_name
    origin_id   = "S3-worthai-customer-admin"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    min_ttl                = 86400
    default_ttl            = 86400
    max_ttl                = 86400
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "S3-worthai-customer-admin"
    viewer_protocol_policy = "redirect-to-https"
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  # Define custom error responses
  custom_error_response {
    error_code      = 400
    response_code   = 200
    response_page_path = "/index.html"
    error_caching_min_ttl = 86400
  }

  # Add custom error response for error code 403
  custom_error_response {
    error_code              = 403
    response_code           = 200
    response_page_path      = "/index.html"  
    error_caching_min_ttl   = 86400
  }

  #aliases = ["customer.staging.joinworth.com"]

  viewer_certificate {
    cloudfront_default_certificate = true
    #remove above line and add below one
    #acm_certificate_arn = "arn:aws:acm:region:your-account-id:certificate/your-acm-certificate-arn"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method  = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"  # Allow access from all locations
    }
  }

  # Define the distribution description
  comment = "WorthAI Customer CloudFront Distribution"

}

#########################################################################################

# CREATE WORTH ADMIN CLOUDFRONT DISTRIBUTION 

resource "aws_cloudfront_distribution" "worthai_applicant_cloudfront" {
  origin {
    domain_name = aws_s3_bucket.worthai_applicant.bucket_regional_domain_name
    origin_id   = "S3-worthai-applicant-admin"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    min_ttl                = 86400
    default_ttl            = 86400
    max_ttl                = 86400
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "S3-worthai-applicant-admin"
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

  }

  # Define custom error responses
  custom_error_response {
    error_code      = 400
    response_code   = 200
    response_page_path = "/index.html"
    error_caching_min_ttl = 86400
  }

  # Add custom error response for error code 403
  custom_error_response {
    error_code              = 403
    response_code           = 200
    response_page_path      = "/index.html"  
    error_caching_min_ttl   = 86400
  }

  #aliases = ["app.staging.joinworth.com"]

  viewer_certificate {
    cloudfront_default_certificate = true
    #remove above line and add below one
    #acm_certificate_arn = "arn:aws:acm:region:your-account-id:certificate/your-acm-certificate-arn"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method  = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"  # Allow access from all locations
    }
  }

  # Define the distribution description
  comment = "WorthAI Applicant CloudFront Distribution"

}

#########################################################################################

# OUTPUT 

output "cloudfront_ids" {
  description = "List of Cloudfront Distributions Created"
  value = [
    aws_cloudfront_distribution.worthai_worthadmin_cloudfront.id,
    aws_cloudfront_distribution.worthai_customeradmin_cloudfront.id,
    aws_cloudfront_distribution.worthai_applicant_cloudfront.id
  ]
}

##########################################################################################
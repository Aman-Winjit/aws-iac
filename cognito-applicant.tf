resource "aws_cognito_user_pool" "worth_applicant" {
  name = var.applicant_user_pool_name

  # Email sign-in configuration
  username_attributes = ["email"]
  auto_verified_attributes = ["email"]
   
  schema {
    name                 = "email"
    attribute_data_type  = "String"
    mutable              = true
    required             = true
  }

  schema {
    name                 = "given_name"
    attribute_data_type  = "String"
    mutable              = true
    required             = true
  }

  schema {
    name                 = "family_name"
    attribute_data_type  = "String"
    mutable              = true
    required             = true
  }

#   schema {
#     name                 = "updated_at"
#     attribute_data_type  = "DateTime"
#     mutable              = true
#     required             = true
#   }

  schema {
    name                        = "id"
    attribute_data_type         = "String"
    mutable                     = true
    string_attribute_constraints {
      min_length = 36
      max_length = 36
    }
  }

  password_policy {
    minimum_length = 8
    require_lowercase = true
    require_numbers = true
    require_symbols = true
    require_uppercase = true
  }

   # Email configuration
  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"

    # For email_sending_account = "DEVELOPER"
    # source_arn = aws_ses_email_identity.no_reply_identity.arn
    # from_email_address = "no-reply@joinworth.com"
  }

  # Optional MFA configuration
  mfa_configuration = "OPTIONAL"
  software_token_mfa_configuration {
    enabled = true
  }

  # Setting Authenticator apps as the preferred MFA method
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
    recovery_mechanism {
      name     = "verified_phone_number"
      priority = 2
    }
  }
}

#####################################################################################

resource "aws_cognito_user_pool_client" "worth_applicant_client" {
  name = var.applicant_client_name
  user_pool_id = aws_cognito_user_pool.worth_applicant.id

  # App client configuration
  generate_secret = false
  callback_urls = [var.cognito_callback_url]
  allowed_oauth_flows = ["code"]
  allowed_oauth_scopes = ["openid", "email"]
  explicit_auth_flows = ["ALLOW_ADMIN_USER_PASSWORD_AUTH","ALLOW_REFRESH_TOKEN_AUTH","ALLOW_USER_PASSWORD_AUTH","ALLOW_USER_SRP_AUTH","ALLOW_CUSTOM_AUTH"]
  allowed_oauth_flows_user_pool_client = true
  prevent_user_existence_errors = "ENABLED"
  supported_identity_providers = ["COGNITO"]
  token_validity_units {
    access_token = "hours"
    id_token = "hours"
    refresh_token = "days"
  }
  access_token_validity = 1
  id_token_validity = 1
  refresh_token_validity = 30
}

#####################################################################################

resource "aws_cognito_user_pool_domain" "worth_applicant_domain" {
  domain = var.applicant_domain_prefix
  user_pool_id = aws_cognito_user_pool.worth_applicant.id
}
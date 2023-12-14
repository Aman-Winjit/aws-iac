# SETUP SES USING EMAIL

resource "aws_ses_email_identity" "no_reply_identity" {
  email = var.ses_email
}

##########################################################################################

# OUTPUT ARN

output "ses_identity_arn" {
  value = aws_ses_email_identity.no_reply_identity.arn
}
locals {
  domains = [
    var.admin_domain,
    var.customer_domain,
    var.applicant_domain,
    var.backend_domain,
    var.argocd_domain
  ]
}

resource "aws_acm_certificate" "admin_certificate" {
  domain_name       = local.domains[0]
  validation_method = "DNS"
  key_algorithm     = "RSA_2048"
}

resource "aws_acm_certificate" "customer_certificate" {
  domain_name       = local.domains[1]
  validation_method = "DNS"
  key_algorithm     = "RSA_2048"
}

resource "aws_acm_certificate" "app_certificate" {
  domain_name       = local.domains[2]
  validation_method = "DNS"
  key_algorithm     = "RSA_2048"
}

resource "aws_acm_certificate" "api_certificate" {
  domain_name       = local.domains[3]
  validation_method = "DNS"
  key_algorithm     = "RSA_2048"
}

resource "aws_acm_certificate" "argocd_certificate" {
  domain_name       = local.domains[4]
  validation_method = "DNS"
  key_algorithm     = "RSA_2048"
}

init:
    terraform init

plan:
    terraform plan -var-file="variables.tfvars" -var-file="secrets.tfvars"

apply:
    terraform apply -var-file="variables.tfvars" -var-file="secrets.tfvars" -auto-approve

destroy:
    terraform destroy -var-file="variables.tfvars" -var-file="secrets.tfvars" -auto-approve

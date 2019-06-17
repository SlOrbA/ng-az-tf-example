# ng-az-tf-example
Angular SPA hosted in Azure Storage managed with Terraform

### Requirements
#### Software
- Angular CLI (verified with 6.2.4 ARM)
- Azure CLI (verifed with 2.0.64 ARM)
- Terraform (verfied with 0.12.2 ARM)
#### Azure CLI
You need to be loggedin in with the Azure CLI and the subscription you want to deploy to needs to be set as the default.

## Steps
1. git clone https://github.com/SlOrbA/ng-az-tf-example
1. cd ng-az-tf-example/example-app
1. bg build
1. cd ../terraform
1. terraform plan
1. review the changes terraform is proposing
1. terraform apply
1. use curl of brower to view the output url


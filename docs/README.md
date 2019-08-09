# ng-az-tf-example

## Welcome to Angular App on Azure Storage with Terraform tutorial

The goal is to setup a Angular Application with the most automation and minimal costs

### Required software 

* Angular CLI (verified with 8.1.1 ARM)
* Azure CLI (verifed with 2.0.64 ARM)
* Terraform (verfied with 0.12.2 ARM)

#### Azure CLI credentials
You need to be logged in with the Azure CLI and the subscription you want to deploy to needs to be set as the default.

## Steps
1. `git clone https://github.com/SlOrbA/ng-az-tf-example`
1. `cd ng-az-tf-example/example-app`
1. `ng build`
1. `cd ../terraform`
1. `terraform init`
1. `terraform plan`
1. review the changes terraform is proposing
1. `terraform apply`
1. use curl of brower to view the output url

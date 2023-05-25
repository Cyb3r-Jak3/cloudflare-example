# R2 Terraform

Example repo for controlling [Cloudflare R2](https://developers.cloudflare.com/r2) buckets with [Terraform](https://www.terraform.io/).

## Get Started

1. Create a variable file (I use `vars.tfvars`) and add your Cloudflare account ID.
2. Create an R2 API token and add those credentials to the `vars.tfvars` file.
3. Run `terraform plan -out tfplan -var-file vars.tfvars` and confirm the output
4. Run `terraform apply tfplan`

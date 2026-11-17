<!-- BEGIN_TF_DOCS -->
![Beta Status](https://img.shields.io/badge/Status-Beta-yellow)

# VKCS KMS KeyManager migration Terraform module
A Terraform module for `KMS` in VKCS that migrates secrets from VKCS KeyManager.

## Usage

### All secrets to be migrated
```hcl
module "keymanager_migrator" {
  source = "https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.1.0.zip//terraform-vkcs-kms-0.1.0/modules/keymanager-migrator"
  token  = "my-secret-token"
}
```

### Specified secrets to be migrated
```hcl
module "keymanager_migrator" {
  source  = "https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.1.0.zip//terraform-vkcs-kms-0.1.0/modules/keymanager-migrator"
  secrets = ["76150cdb-1768-4e90-88f2-b4690c0893ee", "427eeaac-0775-40e9-a8ad-6ae175e7976b"]
  token   = "my-secret-token"
}
```

## Examples
You can find examples in the [`examples`](./examples) directory on [GitHub](https://github.com/vk-cs/terraform-vkcs-kms/tree/v0.1.0/modules/keymanager-migrator/examples).

Running an example:
- Clone [GitHub repository](https://github.com/vk-cs/terraform-vkcs-kms) and checkout tag v0.1.0.
  Or get [module archive](https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.1.0.zip) and unpack it.
- [Install Terraform](https://cloud.vk.com/docs/en/tools-for-using-services/terraform/quick-start). **Note**: You do not need `vkcs_provider.tf` to run module example.
- [Init Terraform](https://cloud.vk.com/docs/en/tools-for-using-services/terraform/quick-start#terraform_initialization) from the example folder.
- [Run Terraform](https://cloud.vk.com/docs/en/tools-for-using-services/terraform/quick-start#creating_resources_via_terraform) to create example resources.
- Check example output and explore created resources with `terraform show`, management console, CLI and API requests.
- Remove example resources with `terraform destroy -auto-approve --refresh=false`

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.3)

- <a name="requirement_http"></a> [http](#requirement\_http) (>= 2.0)

- <a name="requirement_vkcs"></a> [vkcs](#requirement\_vkcs) (>= 0.19, < 1.0.0)

## Resources

The following resources are used by this module:

- [vkcs_kms_secret.secrets](https://registry.terraform.io/providers/vk-cs/vkcs/latest/docs/resources/kms_secret) (resource)
- [http_http.payloads](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) (data source)
- [http_http.secrets](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_token"></a> [token](#input\_token)

Description: VKCS API token

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_secrets"></a> [secrets](#input\_secrets)

Description: set of secrets to migrate from VKCS KeyManager to VKCS KMS. default is all secrets

Type: `set(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_migrated_secrets"></a> [migrated\_secrets](#output\_migrated\_secrets)

Description: set of secrets that have been migrated from VKCS KeyManager to VKCS KMS
<!-- END_TF_DOCS -->
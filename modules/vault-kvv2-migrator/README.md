<!-- BEGIN_TF_DOCS -->
![Beta Status](https://img.shields.io/badge/Status-Beta-yellow)

# VKCS KMS Vault migration Terraform module
A Terraform module for `KMS` in VKCS that migrates secrets from HashiCorp Vault / OpenBao.

## Usage

### All secrets to be migrated
```hcl
module "vault_kvv2_migrator" {
  source = "https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.1.0.zip//terraform-vkcs-kms-0.1.0/modules/vault-kvv2-migrator"
}
```

### Specified secrets to be migrated
```hcl
module "vault_migrator" {
  source  = "https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.1.0.zip//terraform-vkcs-kms-0.1.0/modules/vault-kvv2-migrator"
  secrets = ["my-secret", "sample-text"]
}
```

## Examples
You can find examples in the [`examples`](./examples) directory on [GitHub](https://github.com/vk-cs/terraform-vkcs-kms/tree/v0.1.0/modules/vault-migrator/examples).

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

- <a name="requirement_vault"></a> [vault](#requirement\_vault) (>= 5.0.0)

- <a name="requirement_vkcs"></a> [vkcs](#requirement\_vkcs) (>= 0.19, < 1.0.0)

## Resources

The following resources are used by this module:

- [vkcs_kms_secret.secrets](https://registry.terraform.io/providers/vk-cs/vkcs/latest/docs/resources/kms_secret) (resource)
- [vault_kv_secret_v2.secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/kv_secret_v2) (data source)
- [vault_kv_secrets_list_v2.secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/kv_secrets_list_v2) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_mount"></a> [mount](#input\_mount)

Description: mountpath of kv-v2

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_secrets"></a> [secrets](#input\_secrets)

Description: set of secrets to migrate from HashiCorp Vault / OpenBao KVv2 to VKCS KMS. default is all secrets

Type: `set(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_migrated_secrets"></a> [migrated\_secrets](#output\_migrated\_secrets)

Description: set of secrets that have been migrated from HashiCorp Vault / OpenBao KVv2 to VKCS KMS
<!-- END_TF_DOCS -->
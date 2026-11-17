module "vault_migrator" {
  source  = "https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.1.0.zip//terraform-vkcs-kms-0.1.0/modules/vault-kvv2-migrator"
  secrets = ["my-secret", "sample-text"]
}

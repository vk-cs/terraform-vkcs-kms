module "keymanager_migrator" {
  source = "https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.1.0.zip//terraform-vkcs-kms-0.1.0/modules/keymanager-migrator"
  token  = "my-secret-token"
}

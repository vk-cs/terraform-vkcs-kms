module "keymanager-migrator" {
  source  = "https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.0.1.zip//terraform-vkcs-kms-0.0.1/modules/keymanager-migrator"
  secrets = ["76150cdb-1768-4e90-88f2-b4690c0893ee", "427eeaac-0775-40e9-a8ad-6ae175e7976b"]
}

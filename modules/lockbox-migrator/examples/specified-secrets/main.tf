module "lockbox_migrator" {
  source  = "https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.1.0.zip//terraform-vkcs-kms-0.1.0/modules/lockbox-migrator"
  secrets = ["cyql9wymk0zu0nesrbpt", "ly6z55qmac2oiqyil5p3"]
}

module "lockbox_migrator" {
  source  = "https://github.com/vk-cs/terraform-vkcs-kms/archive/refs/tags/v0.0.2.zip//terraform-vkcs-kms-0.0.2/modules/lockbox-migrator"
  secrets = ["cyql9wymk0zu0nesrbpt", "ly6z55qmac2oiqyil5p3"]
}

output "migrated_secrets" {
  value = local.secrets
  description = "set of secrets that have being migrated from Yandex Cloud LockBox to VKCS KMS"
}

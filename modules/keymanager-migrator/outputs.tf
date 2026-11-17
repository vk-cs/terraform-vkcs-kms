output "migrated_secrets" {
  value = local.secrets
  description = "set of secrets that have been migrated from VKCS KeyManager to VKCS KMS"
}

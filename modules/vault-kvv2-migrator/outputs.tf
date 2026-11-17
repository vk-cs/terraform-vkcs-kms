output "migrated_secrets" {
  value = local.secrets
  description = "set of secrets that have been migrated from HashiCorp Vault / OpenBao KVv2 to VKCS KMS"
}

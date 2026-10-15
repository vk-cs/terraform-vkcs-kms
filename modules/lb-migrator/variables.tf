variable "secrets" {
  type        = set(string)
  description = "set of secrets to migrate from LockBox to VKCS KMS"
}

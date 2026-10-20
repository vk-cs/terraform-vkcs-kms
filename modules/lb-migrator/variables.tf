variable "secrets" {
  type        = set(string)
  description = "set of secrets to migrate from LockBox to VKCS KMS. default is all secrets (not more than a 1000)"
  default     = null
}

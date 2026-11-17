variable "secrets" {
  type        = set(string)
  description = "set of secrets to migrate from HashiCorp Vault / OpenBao KVv2 to VKCS KMS. default is all secrets"
  default     = null
}

variable "mount" {
  type        = string
  description = "mountpath of kv-v2"
}

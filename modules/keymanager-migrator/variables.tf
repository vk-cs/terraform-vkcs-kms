variable "secrets" {
  type        = set(string)
  description = "set of secrets to migrate from VKCS KeyManager to VKCS KMS. default is all secrets"
  default     = null
}

variable "token" {
  type = string
  description = "VKCS API token"
  sensitive = true
}

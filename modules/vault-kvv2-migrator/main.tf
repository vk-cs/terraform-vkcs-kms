data "vault_kv_secrets_list_v2" "secrets" {
  mount = var.mount
}

locals {
  // If secrets variable is not set - retrieve secrets from HashiCorp Vault / OpenBao KVv2
  // We assume that a list of secrets' keys is non-sensitive data
  secrets = nonsensitive(toset([
    for secret in data.vault_kv_secrets_list_v2.secrets.names : secret
  ]))
}

data "vault_kv_secret_v2" "secrets" {
  for_each  = local.secrets
  mount = var.mount
  name = each.value
}

resource "vkcs_kms_secret" "secrets" {
  for_each          = data.vault_kv_secret_v2.secrets
  path              = each.key
  data_json         = each.value.data_json
}

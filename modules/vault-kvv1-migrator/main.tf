data "vault_kv_secrets_list" "secrets" {
  path = var.mount
}

locals {
  // If secrets variable is not set - retrieve secrets from HashiCorp Vault / OpenBao KVv1
  // We assume that a list of secrets' keys is non-sensitive data
  secrets = nonsensitive(toset([
    for secret in data.vault_kv_secrets_list.secrets.names : secret
  ]))
}

data "vault_kv_secret" "secrets" {
  for_each  = local.secrets
  path = "${var.mount}/${each.value}"
}

resource "vkcs_kms_secret" "secrets" {
  for_each          = data.vault_kv_secret.secrets
  path              = each.key
  data_json         = each.value.data_json
}

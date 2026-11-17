data "vault_kv_secrets_list" "secrets" {
  count = var.secrets == null ? 1 : 0
  path  = var.mount
}

locals {
  // If secrets variable is not set - retrieve secrets from HashiCorp Vault / OpenBao KVv1
  // We assume that a list of secrets' keys is non-sensitive data
  // data.vault_kv_secrets_list.secrets has a [0] index because count meta makes it a list of lists
  secrets = var.secrets != null ? var.secrets : nonsensitive(toset([
    for secret in data.vault_kv_secrets_list.secrets[0].names : secret
  ]))
}

data "vault_kv_secret" "secrets" {
  for_each = local.secrets
  path     = "${var.mount}/${each.value}"
}

resource "vkcs_kms_secret" "secrets" {
  for_each  = data.vault_kv_secret.secrets
  path      = each.key
  data_json = each.value.data_json
}

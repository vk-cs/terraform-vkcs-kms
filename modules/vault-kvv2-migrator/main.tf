data "vault_kv_secrets_list_v2" "secrets" {
  count = var.secrets == null ? 1 : 0
  mount = var.mount
}

locals {
  // If secrets variable is not set - retrieve secrets from HashiCorp Vault / OpenBao KVv2
  // We assume that a list of secrets' keys is non-sensitive data
  // data.vault_kv_secrets_list_v2.secrets has a [0] index because count meta makes it a list of lists
  // Subdirs such as secret/a/b are not included
  secrets = var.secrets != null ? var.secrets : nonsensitive(toset([
    for secret in data.vault_kv_secrets_list_v2.secrets[0].names : secret if !endswith(secret, "/")
  ]))
}

data "vault_kv_secret_v2" "secrets" {
  for_each = local.secrets
  mount    = var.mount
  name     = each.value
}

resource "vkcs_kms_secret" "secrets" {
  for_each  = data.vault_kv_secret_v2.secrets
  path      = each.key
  data_json = each.value.data_json
}

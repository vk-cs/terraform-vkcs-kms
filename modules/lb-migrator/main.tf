data "yandex_lockbox_secret_version" "secrets" {
  for_each  = var.secrets
  secret_id = each.value
}

locals {
  entries = {
    for secret_id, secret in data.yandex_lockbox_secret_version.tests :
    secret_id => sensitive({
      for entry in secret.entries : entry.key => entry.text_value
    })
  }
}

resource "vkcs_kms_secret" "secrets" {
  for_each = var.secrets

  path      = each.value
  data_json = jsonencode(local.entries[each.key])
}

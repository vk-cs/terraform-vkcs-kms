data "yandex_client_config" "yc_creds" {}

data "http" "secrets" {
  url    = "https://lockbox.api.cloud.yandex.net/lockbox/v1/secrets?pageSize=1000&folderId=${data.yandex_client_config.yc_creds.folder_id}"
  method = "GET"
  request_headers = {
    Authorization = "Bearer ${data.yandex_client_config.yc_creds.iam_token}"
  }
}

data "yandex_lockbox_secret" "secrets" {
  for_each  = local.secrets
  secret_id = each.value
}

data "yandex_lockbox_secret_version" "secrets_data" {
  for_each  = local.secrets
  secret_id = each.value
}

locals {
  // If secrets variable is not set - retrieve secrets from lockbox
  secrets = var.secrets != null ? var.secrets : toset([
    for secret in jsondecode(data.http.secrets.response_body).secrets : secret.id
  ])

  resulting_secrets = {
    for secret_id in local.secrets :
    secret_id => {
      delete_protection = data.yandex_lockbox_secret.secrets[secret_id].deletion_protection
      entries = sensitive({
        for entry in data.yandex_lockbox_secret_version.secrets_data[secret_id].entries : entry.key => entry.text_value
      })
    }
  }
}

resource "vkcs_kms_secret" "secrets" {
  for_each          = local.secrets
  path              = each.value
  data_json         = jsonencode(local.resulting_secrets[each.key].entries)
  delete_protection = local.resulting_secrets[each.key].delete_protection
}

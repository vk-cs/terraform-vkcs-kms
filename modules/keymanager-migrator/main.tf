data "http" "secrets" {
  url    = "https://msk.cloud.vk.ru/infra/keymanager/v1/secrets?limit=100"
  method = "GET"
  request_headers = {
    X-Auth-Token = "${var.token}"
  }
}

locals {
  // If secrets variable is not set - retrieve secrets from lockbox
  secrets = var.secrets != null ? var.secrets : toset(compact([
    for secret in jsondecode(data.http.secrets.response_body).secrets :
    secret.secret_type == "opaque" ?
    basename(secret.secret_ref) :
    ""
  ]))
}

data "http" "payloads" {
  for_each = local.secrets
  url      = "https://msk.cloud.vk.ru/infra/keymanager/v1/secrets/${each.value}/payload"
  method   = "GET"
  request_headers = {
    X-Auth-Token = "${var.token}"
  }
}

locals {
  resulting_secrets = {
    for secret_id in local.secrets : secret_id => sensitive({
      data = data.http.payloads[secret_id].response_body
    })
  }
}

resource "vkcs_kms_secret" "secrets" {
  for_each  = local.resulting_secrets
  path      = each.key
  data_json = jsonencode(each.value)
}

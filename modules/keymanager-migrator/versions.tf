terraform {
  required_version = ">= 1.3"
  required_providers {
    vkcs = {
      source  = "vk-cs/vkcs"
      version = ">= 0.19, < 1.0.0"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.6.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
  required_version = ">= 1.5"
}

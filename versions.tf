terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
  required_version = ">= 1.5"
}

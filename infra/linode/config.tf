terraform {
  # this bucket must be created manually (chicken and the egg problem)
  backend "s3" {
    region   = "nyc3"
    bucket   = "sbs-terraform"
    key      = "linode.tfstate"
    endpoint = "nyc3.digitaloceanspaces.com"

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
  }
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
  required_version = ">= 0.13"
}

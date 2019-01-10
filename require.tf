# require.tf

terraform {
  required_version = ">= 0.11.0"
}

provider "template" {
  version = "~> 1.0"
}

provider "digitalocean" {
  version = "~> 1.1"
  token   = "${var.do_token}"
}

provider "dnsimple" {
  version = "~> 0.1"
  token   = "${var.dnsimple_token}"
  account = "${var.dnsimple_account}"
}

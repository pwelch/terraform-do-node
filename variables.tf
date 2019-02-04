# variables.tf

# Module Settings
variable "node_name" {
  description = "Node Name"
  default     = "node-01"
}

variable "node_image" {
  description = "Node Image"
  type        = "string"
  default     = "ubuntu-18-04-x64"
}

variable "node_region" {
  description = "Node Region"
  type        = "string"
  default     = "nyc3"
}

variable "node_size" {
  description = "Node Size"
  type        = "string"
  default     = "s-1vcpu-1gb"
}

# Digital Ocean Provider
variable "do_token" {
  description = "Digital Ocean API Token"
  type        = "string"
}

variable "ssh_fingerprints" {
  type        = "list"
  description = "SSH public key fingerprints. (e.g. see `ssh-add -l -E md5`)"
}

# DNSimple Provider
variable "dnsimple_token" {
  description = "DNSimple API Token"
  type        = "string"
}

variable "dnsimple_account" {
  description = "DNSimple Account ID"
  type        = "string"
}

variable "dnsimple_domain" {
  description = "DNSimple domain"
  type        = "string"
}

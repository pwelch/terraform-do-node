# dns.tf

# Add a record to a sub-domain
resource "dnsimple_record" "node" {
  domain = "${var.dnsimple_domain}"
  name   = "node-01"
  value  = "${digitalocean_droplet.node.ipv4_address}"
  type   = "A"
  ttl    = 3600
}

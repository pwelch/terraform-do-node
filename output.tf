# output.tf

output "node_ipv4" {
  value = ["${digitalocean_droplet.node.*.ipv4_address}"]
}

# main.tf

# DO Tag
resource "digitalocean_tag" "terraform_created" {
  name = "terraform_created"
}

# Chef Provision Recipe Template
data "template_file" "init" {
  template = "${file("${path.module}/templates/default.rb.tpl")}"

  vars {
    hostname = "${var.node_name}"
  }
}

# Create DO Droplet
resource "digitalocean_droplet" "node" {
  name   = "${var.node_name}"
  image  = "${var.node_image}"
  region = "${var.node_region}"
  size   = "${var.node_size}"

  monitoring         = true
  private_networking = true
  ssh_keys           = ["${var.ssh_fingerprints}"]

  tags = ["${digitalocean_tag.terraform_created.id}"]

  # Add Chef Recipe
  provisioner "file" {
    content     = "${data.template_file.init.rendered}"
    destination = "/tmp/default.rb"
  }

  # Provision
  provisioner "remote-exec" {
    inline = [
      "curl -L https://omnitruck.chef.io/install.sh | bash",
      "chef-apply /tmp/default.rb",
    ]
  }
}

# Add a record to a sub-domain
resource "dnsimple_record" "node" {
  domain = "${var.dnsimple_domain}"
  name   = "node-01"
  value  = "${digitalocean_droplet.node.ipv4_address}"
  type   = "A"
  ttl    = 3600
}

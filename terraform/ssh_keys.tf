# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/ssh_key
data "hcloud_ssh_key" "hekatoncheires" {
  fingerprint = "f4:46:b1:6a:d8:ce:95:4d:2c:db:87:ff:83:74:b1:ec"
}

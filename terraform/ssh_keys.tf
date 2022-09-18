# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/ssh_key
data "hcloud_ssh_key" "personal_laptop" {
  fingerprint = "d2:96:c6:17:de:8d:61:a0:16:3d:14:22:c5:3c:a5:47"
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/ssh_key
data "hcloud_ssh_key" "personal_desktop" {
  fingerprint = "ef:1c:91:af:39:21:b5:8a:c1:23:da:52:00:32:c4:b2"
}

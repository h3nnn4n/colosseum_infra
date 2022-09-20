# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/ssh_key
data "hcloud_ssh_key" "personal_laptop" {
  fingerprint = "d2:96:c6:17:de:8d:61:a0:16:3d:14:22:c5:3c:a5:47"
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/ssh_key
data "hcloud_ssh_key" "personal_desktop" {
  fingerprint = "ef:1c:91:af:39:21:b5:8a:c1:23:da:52:00:32:c4:b2"
}

data "hcloud_ssh_key" "key_1" {
  fingerprint = "e3:9e:fd:8c:08:38:76:40:59:00:42:4b:98:ce:b7:66"
}

data "hcloud_ssh_key" "key_2" {
  fingerprint = "9d:d7:0b:ab:ea:05:8d:39:32:45:a7:3a:83:24:28:8c"
}

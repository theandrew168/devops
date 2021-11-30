resource "linode_sshkey" "andrew_macbook" {
  label   = "andrew_macbook"
  ssh_key = chomp(file("${path.module}/../ssh_keys/andrew_macbook.pub"))
}

resource "linode_sshkey" "wesley_klang" {
  label   = "wesley_klang"
  ssh_key = chomp(file("${path.module}/../ssh_keys/wesley_klang.pub"))
}

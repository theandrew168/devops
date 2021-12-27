resource "linode_sshkey" "andrew_macbook" {
  label   = "andrew_macbook"
  ssh_key = chomp(file("${path.module}/../ssh_keys/andrew_macbook.pub"))
}

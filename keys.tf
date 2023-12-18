#resource "random_id" "edr_wg_keypair" {
#  byte_length = 4
#  prefix      = "${var.env_prefix}_wg_ssh_key"
#}
#
#resource "aws_key_pair" "edr_wg_keypair" {
#  key_name   = random_id.edr_wg_keypair.hex
#  public_key = file(var.public_key_path)
#
#  tags = {
#    "Name"      = "${var.env_prefix}_wg_keypair"
#    "Creator"   = var.creator
#    "Terraform" = true
#  }
#}
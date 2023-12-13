resource "aws_instance" "edr_wg_instance" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.edr_wg_keypair.id
  subnet_id              = aws_subnet.edr_wg_public_subnet.id
  vpc_security_group_ids = ["${aws_security_group.edr_wg_sg.id}"]

  user_data = templatefile(
    "${path.module}/wg.tftpl",
      {
        wg_private_key        = var.wg_private_key 
        wg_public_key         = var.wg_public_key
        wg_preshared_key      = var.wg_preshared_key
      }
  )

  tags = {
    "Name"      = "${var.env_prefix}_instance"
    "Creator"   = var.creator
    "Terraform" = true
  }
}
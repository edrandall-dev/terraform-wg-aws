resource "aws_security_group" "edr_wg_sg" {
  name   = "edr_wg_sg"
  vpc_id = aws_vpc.edr_wg_vpc.id

  # SSH access from my IP address
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    #cidr_blocks = ["${chomp(data.http.outbound_ip.body)}/32"]
    cidr_blocks = ["82.21.53.106/32"]
  }

  # Wireguard access from the internet
  ingress {
    from_port   = 13231
    to_port     = 13231
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # No restrictions on traffic originating from inside the VPC
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.base_cidr_block}"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"      = "ed_wg_sg"
    "Creator"   = var.creator
    "Terraform" = true
  }
}
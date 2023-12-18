output "wg_client_config" {
   description = "Generated configuration for wireguard client application"
   value = <<EOT

## Peer 2 ("VPN Client")
[Interface]
PrivateKey = ${var.p2_private_key}
Address = 192.168.123.101/32
DNS = 1.1.1.1

## Peer 1 ("VPN Server")
[Peer]
PublicKey = ${var.p1_public_key}
PresharedKey = ${var.wg_ps_key}
AllowedIPs = 0.0.0.0/0, 192.168.123.0/24
Endpoint = ${aws_instance.edr_wg_instance.public_ip}:13231
PersistentKeepalive = 30
##

EOT
}






/*
output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "ssh_via_vpn" {
  value       = "ssh ubuntu@192.168.0.100 -o 'StrictHostKeyChecking = no' -i ${var.public_key_path}"
  description = "SSH command to connect to the ec2 instance via the VPN"
}

output "wg_endpoint" {
  value       = "The Endpoint URL is ${aws_instance.edr_wg_instance.public_ip}:13231"
  description = "The Public IP for the EC2 Instance"
}

output "ssh_via_internet" {
  value       = "ssh ubuntu@${aws_instance.edr_wg_instance.public_ip} -o 'StrictHostKeyChecking = no' -i ${var.public_key_path}"
  description = "SSH command to connect to the ec2 instance via the internet"
}

*/
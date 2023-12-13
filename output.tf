output "ssh_via_internet" {
  value       = "ssh ubuntu@${aws_instance.edr_wg_instance.public_ip} -o 'StrictHostKeyChecking = no' -i ${var.public_key_path}"
  description = "SSH command to connect to the ec2 instance via the internet"
}

output "ssh_via_vpn" {
  value       = "ssh ubuntu@$192.168.0.100 -o 'StrictHostKeyChecking = no' -i ${var.public_key_path}"
  description = "SSH command to connect to the ec2 instance via the VPN"
}

output "wg_endpoint" {
  value       = "The Endpoint URL is ${aws_instance.edr_wg_instance.public_ip}:13231"
  description = "The Public IP for the EC2 Instance"
}

/*
output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}
*/
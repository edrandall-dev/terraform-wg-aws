output "control_plane_public_ips" {
  value       = "ssh ubuntu@${aws_instance.edr_wg_instance.public_ip} -o 'StrictHostKeyChecking = no' -i ${var.public_key_path}"
  description = "The Public IP for the EC2 Instance"
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
# terraform-wg-aws
Terraform code and wireguard config to create a temporary cloud vpn in AWS using an EC2 instance.

## Purpose
This terraform code (and associated template file containing a bash script) will create an EC2 instance which is running wireguard and can be used as a VPN endpoint.  

> [!NOTE]
> If being used when traveling, the script should ideally be run **before** connecting to a hotel / coffee shop wireless network (use the code to create this environment before setting off)

## Usage instructions
Obtain the code in the usual way, with ```git clone https://github.com/edrandall-dev/terraform-wg-aws```

Ensure that the AWS CLI and terraform are installed and correctly configured on your local machine (laptop)

> [!NOTE]
> The desired region should be set/verified in the ```terraform.tfvars``` file

Change to the code directory with ```cd terraform-wg-aws``` and execute ```./start.sh```

The EC2 instance (and associated cloud resources) will be built within AWS.  Keys are automatically created and a "client" configuration will be provided as a terraform output.  This can be pasted into Wireguard VPN client to connect to the VPN.

To tear the environment down (and delete keys from ```terraform.tfvars``` run the ```./stop``` script.)

Under normal operation, there should be no need to connect to the EC2 instance via SSH, and as such no SSH keys are created.  The following security group rule in ```security.tf``` can be uncommented if an SSH connection is needed (via EC2 Instance Connect):

```
# SSH access from anywhere
  /*
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  */
  ```

## Things to do
 - Region switcher
 - Diagram

# terraform-wg-aws
Terraform code and wireguard config to create a temporary cloud vpn in AWS using an EC2 instance.

> [!WARNING]
> Do **not** make this repository public.  It contains keys.

## Purpose
This terraform code (and associated template file containing a bash script) will create an EC2 instance which is running wireguard and can be used as a VPN endpoint.  

> [!NOTE]
> If being used when traveling, the script should ideally be run **before** connecting to a hotel / coffee shop wireless network (use the code to create this environment before setting off)

## Usage instructions
Obtain the code in the usual way, with ```git clone https://github.com/edrandall-dev/terraform-wg-aws```

Ensure that the AWS CLI and terraform are installed and correctly configured on your local machine (laptop)

Change to the code directory with ```cd terraform-wg-aws``` and execute ```terraform apply -auto-approve```

The EC2 instance (and associated cloud resources) will be built within AWS.  Use the Wireguard VPN client (either on local machine or travel router) to connect to the VPN.

> [!IMPORTANT]
> Remember to add the correct IP address for the EC2 instance in the local wireguard config when provided by the terraform output.

## Local Wireguard config
```
[Interface]
PrivateKey = eHFmxtHDEokilj8FQHvvdk4KkCS9ArHg3Zb6QOtjMEw=
Address = 192.168.123.101/32
DNS = 1.1.1.1

[Peer]
PublicKey = IHSdnNe14ZIbSwW5YELVjQXMB86rYvL+yyA70c5XWSU=
PresharedKey = cPyF7XPI4ShtHSxqpqyfrljUPB5AecMM/Lo/M8I/rcM=
AllowedIPs = 0.0.0.0/0, 192.168.123.0/24
Endpoint = 35.177.209.77:13231
PersistentKeepalive = 30
```

## Things to do
 - Region switcher
 - Create fresh keys each time and generate config
 - Tidy up outputs

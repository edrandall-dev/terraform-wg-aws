#The following variable values should be checked/amended before running ./start.sh
region = "eu-west-2" 
wireguard_port  = 13231
base_cidr_block = "192.168.0.0/16"
creator         = "Ed Randall"
instance_type   = "t3.micro"
env_prefix      = "edr_wg"

#Keys will be generated by the ./start.sh script
p1_private_key   = ""
p1_public_key    = ""
p2_private_key   = ""
p2_public_key    = ""
wg_ps_key        = ""

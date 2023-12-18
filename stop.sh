#!/bin/bash

terraform destroy -auto-approve

#Remove lines containing keys from terraform.tfvars
sed -i '' '/^p1_private_key/d' terraform.tfvars
sed -i '' '/^p1_public_key/d' terraform.tfvars
sed -i '' '/^p2_private_key/d' terraform.tfvars
sed -i '' '/^p2_public_key/d' terraform.tfvars
sed -i '' '/^wg_ps_key/d' terraform.tfvars

#Add empty keys into terraform.tfvars
echo "p1_private_key   = \"\"" >> terraform.tfvars
echo "p1_public_key    = \"\"" >> terraform.tfvars
echo "p2_private_key   = \"\"" >> terraform.tfvars
echo "p2_public_key    = \"\"" >> terraform.tfvars
echo "wg_ps_key        = \"\"" >> terraform.tfvars



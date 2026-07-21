#!/bin/sh

echo "===== VARIABLES ====="
env | sort

echo "===== instances ====="
echo "$instances"

chmod 600 /mnt/workspace/AWS_New_key.pem

cat > /mnt/workspace/inventory.ini <<EOF
[ubuntu_servers]
EOF

for instance in $(echo "$instances" | jq -r '.[]'); do
  echo "$instance ansible_user=ubuntu ansible_ssh_private_key_file=/mnt/workspace/AWS_New_key.pem" >> /mnt/workspace/inventory.ini
done

RESOURCE_GROUP=""
LOCATION="westus"
USER="adminUser"
BACK_VM="back"
DB_VM="db"
IP_DIR="10.0.0.1"


echo "[back]" >> inventary.ini
echo "$IP_DIR ansible_user=$USER ansible_ssh_private_key_file=./ssh_$BACK_VM\_key" >> inventary.ini
echo "[db]" >> inventary.ini
echo "10.0.2.5 ansible_user=$USER ansible_ssh_private_key_file=./ssh_$BACK_VM\_key"  >> inventary.ini
echo "[db:vars]" >> inventary.ini
echo "ansible_ssh_common_args='-o ProxyCommand="ssh -i ./ssh_$BACK_VM\_key -W %h:%p $USER@$IP_DIR"'" >> inventary.ini

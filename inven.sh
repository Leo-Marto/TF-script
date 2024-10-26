#!/bin/bash



# Definir variables
RESOURCE_GROUP=""
VM_NAME=""
USER="adminUser"



# Cargamos los argumentos a las variables

while getopts ":r:n:u:i" opt; do
   case $opt in
          r)
            RESOURCE_GROUP="$OPTARG";;
   esac
done

if [ -z "$RESOURCE_GROUP" ]; then
  echo " Para el uso correcto del comando se debe carga"
  echo " -r <NOMBRE_RESOURCE_GROUP>"
fi
# if [ -z "$VM_NAME" ]; then
#   echo " Se debe cargar el nombre del de la VM"
#   exit 1
# fi
# if [ -z "$USER" ]; then
#   echo " Se debe cargar el nombre de usuario"
#   exit 1
# fi
# if [ -z "$INVENTORY_FILE" ]; then
#   echo " Se debe cargar el nombre del grupo de recursos"
#   exit 1
# fi


echo "las variables tomadas son Grupo de recursos: $RESOURCE_GROUP "

echo "resource_group_name = '$RESOURCE_GROUP'" >> var.tfvars

cat var.tfvars

terraform init

if [ $? -eq 0 ]; then
  terraform plan -var-file="var.tfvars"
  if [ $? -eq 0 ]; then
    terraform apply -var-file="var.tfvars"
    else
    exit 1
  fi
else 
exit 1
fi




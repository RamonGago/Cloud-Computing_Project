#!/bin/bash

# Se crea un grupo de recursos.
az group create --name cloud --location westeurope

# Se crea una máquina virtual con UbuntuLTS 16.04 y se generan las claves ssh.
# Además se extrae la IP pública de la máquina y se guarda en la variable $ip.
echo "---- Creating virtual machine ----"

ip=$(az vm create --resource-group cloud --name UbuntuVM --image UbuntuLTS --generate-ssh-keys | jq -r '.publicIpAddres$

echo "¡¡Virtual machine created!!"

echo -name : UbuntuVM
echo -ip : $ip

# Se abre el puerto 22 para permitir el tráfico ssh en la máquina virtual.
az vm open-port --port 22 --resource-group cloud --name UbuntuVM

# Se actualiza el usuario de despliegue con la clave ssh pública
az vm user update --resource-group cloud -n UbuntuVM -u rgago --ssh-key-value "$(< ~/.ssh/id_ecdsa.pub)"

# Por último se provisiona la máquina virtual. 
# Pasándole la ip de la máquina al archivo hosts y se ejecuta el playbook de ansible.
echo "---- Provisioning virtual machine ----"-

echo $ip >> hosts
ansible-playbook provision.yml

echo "You can now connect using 'ssh deploy@${ip}'"


# HITO 3 - Automation of virtual machines creation ([Azure](https://azure.microsoft.com/es-es/))

## Introducción

La automatización de la creación de máquinas virtuales se ha realizado a través del cliente de [Azure](https://azure.microsoft.com/es-es/), que ha sido el elegido desde un primer momento para el despliegue de máquinas virtuales en la nube, gracias a su sencillo manejo.

En las máquinas virtuales desplegadas, tanto para realizar las pruebas como para ejecutar el script de automatización, se ha utilizado el SO [Ubuntu Server 16.04.3 LTS](https://wiki.ubuntu.com/XenialXerus/ReleaseNotes?_ga=2.130289736.659109912.1510849497-1227624830.1510666285). Esta decisión viene dada por la familiaridad con este SO  y su amplia comunidad de soporte. Además el hecho de que sea una versión [LTS](https://wiki.ubuntu.com/LTS)(Long Term Support) proporciona un valor añadido a la hora de su elección.

### Instalaciones a realizar

Previamente se debe instalar ansible en la máquina que vaya a realizar el provisionamiento.
```
sudo pip install ansible
```

También se instalará [jq](https://stedolan.github.io/jq/), un procesador JSON liviano y flexible de línea de comandos.

```
sudo apt-get install jq
```

Para realizar el provisionamiento se debe instalar la consola de Azure.
El primer paso será instalar [python](https://www.python.org/) (si no lo está) en tu máquina y una vez realizado sólo quedará introducir los siguientes comandos para proceder con la instalación de la consola de Azure.

```
sudo apt-get install python
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
     sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli
```

## Provisionamiento

### Descripción

En primer lugar se conectará el cliente con la cuenta de Azure a través del comando:
```
az login
```
Tras seguir sus instrucciones estarás conectado a tu cuenta de Azure.

A continuación sólo quedará utilizar el script "acopio.sh" que se muestra a continuación:

```
#!/bin/bash

# Se crea un grupo de recursos.
az group create --name cloud --location westeurope

# Se crea una máquina virtual con UbuntuLTS 16.04.3 y se generan las claves ssh.
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

```

El script de provisionamiento será el siguiente:
```
---
- hosts: all
  sudo: yes
  tasks:
    - name: Install Python Pip
      apt:
        name: python-pip
        state: present
        force: yes
        update_cache: yes

      - name: Install MongoDB
        apt:
          name: mongodb
          state: present
          force: yes
          update_cache: yes

      - name: Install Nginx
        apt:
          name: nginx
          state: present
          force: yes
          update_cache: yes

      - name: Install Pymongo
        pip:
          name: pymongo

      - name: Install Flask
        pip:
          name: flask

      - name: Install Flask Restful
        pip:
          name: flask-restful

      - name: Install Flask Jsonpify
        pip:
          name: flask-jsonpify
```

Por último se ejecuta el script "acopio.sh":
```
sh acopio.sh
```

Una vez ejecutado, en las siguientes imágenes se puede observar cómo se ha creado y provisionado automáticamente la máquina virtual:

![alt text](automation/images/automation_capture1.png "Automation1")

![alt text](automation/images/automation_capture2.png "Automation2")

![alt text](automation/images/automation_capture3.png "Automation3")

# HITO 4 - Virtual machines orchestration ([Azure](https://azure.microsoft.com/es-es/))

## Introducción

Para realizar la orquestación de máquinas virtuales sobre la plataforma virtual de Azure se ha seleccionado Vagrant, una herramienta para desarrolladores que facilita la creación de entornos virtuales para desarrollo.
Tras el estudio de diversas imágenes de sistemas operativos, se ha optado por una distribución [Debian](https://www.debian.org/intro/about#what).
A diferencia de anteriores hitos, en los que se utilizaba [Ubuntu Server 16.04.3 LTS](https://wiki.ubuntu.com/XenialXerus/ReleaseNotes?_ga=2.130289736.659109912.1510849497-1227624830.1510666285), se ha decidido variar el SO para comprobar como Debian proporciona unas características de rendimiento y seguridad superiores a la de sus "competidores".

### Instalaciones a realizar

Para proceder con el uso de Vagrant se debe realizar su instalación y conexión con Azure, posteriormente se realizará el provisionamiento.
La versión que se utilizará será la última que proporciona Vagrant en su página principal, [2.0.1](https://www.vagrantup.com/downloads.html).
A continuación se procederá con la instalación del complemento [Vagrant] (http://www.vagrantup.com) 2.0.0 que agrega [Microsoft Azure] (https://azure.microsoft.com)
proveedor de Vagrant, lo cual le permite controlar y provisionar máquinas en Microsoft Azure. Este provisionamiento se efectuará a través de ansible de manera idéntica a la realizada en el [Hito 4](https://github.com/RamonGago/Cloud-Computing_Project/blob/master/automation/README.md).

Para ello se ejecutará:

- `vagrant plugin install vagrant-azure` para la instalación y uso del plugin de Azure en Vagrant

## Orquestación

### Descripción

- `az login` para loguearse en Azure
- `az ad sp create-for-rbac` para crear un [Azure Active Directory Application](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-application-objects) con acceso al [Administrador de recursos de Azure](https://docs.microsoft.com/es-es/azure/azure-resource-manager/resource-group-overview) para la subscripción actual de Azure

La salida de `az ad sp create-for-rbac` debería mostrar una salida como la siguiente:
```json
{
  "appId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
  "displayName": "some-display-name",
  "name": "http://azure-cli-2017-12-01-14-50-32",
  "password": "XXXXXXXXXXXXXXXXXXXX",
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

- Si se desea utilizar una suscripción diferente a la actual en Azure, basta con ejecutar `az account set --subscription 'your subscription name'`
- `az account list --query "[?isDefault].id" -o tsv` para extraer el id de la subscripción

Para montar una máquina virtual con Vagrant se debe crear un archivo llamado [Vagrantfile](/Vagrantfile), el cual contiene la configuración necesaria para utilizarla.

Para utilizar dicha configuración se selecciona la máquina de azure:

- `vagrant box add azure https://github.com/azure/vagrant-azure/raw/v2.0/dummy.box --provider azure`

Por último sólo quedará ejecutar un `vagrant up --provider=azure` y las máquinas comenzarán a instalarse y provisionarse.

## Más información
Para más información visitar el siguiente [enlace](https://github.com/Azure/vagrant-azure/tree/v2.0/docs).

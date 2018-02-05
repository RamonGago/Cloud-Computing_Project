# HITO 6 - Combination of the virtual infrastucture to deploy a concrete application ([Docker-compose](https://docs.docker.com/compose/))

## Introducción

Para realizar la composición de servicios se ha utilizado el servicio proporcionado por Docker-compose. Se han utilizado dos imágenes para componer el servicio, en primer lugar se ha optado por la imagen oficial de python2.7 (que despliega el servicio web) y en segundo la oficial de MongoDB (para el despliegue del volumen con la base de datos).
La elección viene dada por su simplicidad y ligereza a la hora de desplegar un servicio tan sencillo como el creado. Ambas imágenes proporcionan los servicios mínimos y necesarios para la realización de esta parte del servicio.

## Composición del servicio a desplegar

### Creación del servicio a desplegar

En primer lugar se procede a la creación de la imagen a través del `Dockerfile` que ejecutará el microservicio realizado.
En este caso, ofrece una parte del sistema a desarrollar para realizar un erasmus. Además el microservicio `app.py` devolverá `status: "OK"`.

Por otro lado a través del archivo `docker-compose.yml` se creará el volumen que contendrá los datos que genera el servicio. Por un lado se crea la parte del servicio web y por la otra la de la base de datos a través de MongoDB.

Una vez compuestos todos los archivos para su despliegue, se procede a crear una máquina virtual con docker y docker-compose preinstalados dónde poder alojar los contenedores a desplegar.

### Despliegue del servicio

Para ello en primer lugar se creará un grupo de recursos:

- `az group create --name serviceGroup --location westeurope` para crear un [grupo de recursos](https://docs.microsoft.com/es-es/azure/azure-resource-manager/resource-group-overview).

Y se crea la máquina virtual:

-`az group deployment create --resource-group serviceGroup --template-uri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/docker-simple-on-ubuntu/azuredeploy.json`

Tras introducir los datos solicitados (todos deben estar en minúsculas, salvo la contraseña) la máquina se creará y será necesario instalar `git` para poder clonar el repositorio y realizar el despliegue automáticamente a través del comando `sudo docker-compose up -d`.

Para realizar todo ello se ha utilizado un script  que realiza una limpieza de los dockers existentes y realiza un nuevo clonado y un `sudo docker-compose up -d` para desplegar el servicio. Esto se ha realizado para poder hacer cambios en el servicio de una manera más rápida.

![alt text](/compose/images/despliegue_1.png "Despliegue_1")

![alt text](/compose/images/despliegue_2.png "Despliegue_2")

Desde ese momento el servicio quedará activo mientras la máquina virtual esté en funcionamiento:

![alt text](/compose/images/servicio.png "Servicio")

![alt text](/compose/images/statusOK.png "Status")

## Más información
Para la realización del servicio se ha seguido la siguiente [guía](http://containertutorials.com/docker-compose/flask-mongo-compose.html).

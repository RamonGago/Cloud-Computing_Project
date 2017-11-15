# Cloud-Computing_Project

## Descripción del problema

Tomando como base el desarrollo del TFG "Erasmus Management System", este proyecto de Cloud Computing busca desarrollar de una manera eficiente un gestor de documentación personal en la nube.


## Solución propuesta

La solución que se propone es el desarrollo de una aplicación que permita mantener los documentos clasificados en un entorno virtual permitiendo la compartición entre diversos usuarios de una manera sencilla, rápida y eficaz.

## Introducción descriptiva del proyecto

Para desarrollar el proyecto, este constará de los siguientes servicios para almacenar e intercambiar los documentos de los usuarios:

- Almacenamiento en una base de datos `NOSQL` ==> `MongoDB`
- Lenguaje de programación ==> `Python`
- Utilización de un microframework para Python ==> `Flask` 
- Motor de plantillas ==> `Jinja2`
- Servidor `HTTP` ==> `Nginx`
- Creación de una `API REST` pública

![alt text](images/Flask+Mongo+Nginx+Jinja2.png "Diagrama")

## Arquitectura

- Se utilizará una arquitectura basada en microservicios.

- La programación de la aplicación se realizará a través de los servicios detallados en el apartado anterior.

- Se desplegará en la nube a través de los servicios proporcionados por [Azure](https://azure.microsoft.com/es-es/).

## Aprovisionamiento

* Pip
* MongoDB
* Nginx
* Librerías python instaladas:
  * PyMongo
  * Flask
  * Flask-restful
  * Flask-jsonpify

## Planificación

* Hito 3 => Orquestación de máquinas virtuales.
* Hito 4 => Uso de contenedores.
* Hito 5 => Combinación de infraestructuras virtuales para desplegar una aplicación completa.


## Licencia
Este proyecto será liberado bajo la licencia [GNU GLP V3](https://github.com/RamonGago/Cloud-Computing_Project/blob/master/LICENSE)

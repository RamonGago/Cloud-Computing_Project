# Cloud-Computing_Project

Repositorio para el desarrollo del proyecto de Cloud Computing, asignatura del Máster Profesional Ingeniería Informática en la [UGR](https://www.ugr.es/).

## [Web del proyecto](https://ramongago.github.io/Cloud-Computing_Project/)

## Descripción del proyecto

Tomando como base el desarrollo del TFG ["Erasmus Management System"](http://www.emsystem.eu/), este proyecto de Cloud Computing busca desarrollar de una manera eficiente un gestor de documentación personal en la nube.


## Solución propuesta

La solución que se propone es el desarrollo de una aplicación que permita mantener los documentos clasificados en un entorno virtual, permitiendo la compartición entre diversos usuarios de una manera sencilla, rápida y eficaz.

## Introducción descriptiva del proyecto

Para desarrollar el proyecto, este constará de los siguientes servicios para almacenar e intercambiar los documentos de los usuarios:

> Almacenamiento en una base de datos `NOSQL` ==> `MongoDB`
> Lenguaje de programación ==> `Python`
> Utilización de un microframework para Python ==> `Flask`
> Motor de plantillas ==> `Jinja2`
> Servidor `HTTP` ==> `Nginx`
> Creación de una `API REST` pública

![alt text](images/Flask+Mongo+Nginx+Jinja2.png "Diagrama")

## Arquitectura

- Arquitectura basada en microservicios.

- Los microservicios serán desplegados en la nube, concretamente en una máquina virtual con [Ubuntu Server 16.04.3 LTS](https://wiki.ubuntu.com/XenialXerus/ReleaseNotes?_ga=2.130289736.659109912.1510849497-1227624830.1510666285), a través de los servicios proporcionados por [Azure](https://azure.microsoft.com/es-es/).

## Provisionamiento

Se ha decidido llevar a cabo el provisionamiento a través de Ansible, un motor de orquestación muy simple que automatiza las tareas de provisionamiento en máquinas virtuales.

En el siguiente enlace se puede acceder a las instrucciones de instalación del mismo:

* [Provisionamiento con Ansible](provision/ansible/)

## Planificación

> :white_check_mark: Hito 0 => Creación de repositorio en Github y manejo de las herramientas a utilizar.
> :white_check_mark: Hito 1 => Estructuración y descripción del proyecto a llevar a cabo.
> :white_check_mark: Hito 2 => Provisionamiento de máquinas virtuales.
> Hito 3 => Automatización de la creación máquinas virtuales.
> Hito 4 => Uso de contenedores.
> Hito 5 => Combinación de infraestructuras virtuales para desplegar una aplicación completa.


## Licencia
Este proyecto será liberado bajo la licencia [GNU GLP V3](https://github.com/RamonGago/Cloud-Computing_Project/blob/master/LICENSE)

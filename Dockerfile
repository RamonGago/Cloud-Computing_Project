FROM projectatomic/atomicapp

MAINTAINER Ramón Gago Carrera <ramongagocarrera@gmail.com>

WORKDIR /server

# Actualiza la imagen con los últimos paquetes
RUN yum update -y; yum clean all

# Instala python-pip
RUN yum -y install epel-release && yum clean all
RUN yum -y install python-pip && yum clean all

# Instala flask y las librerías necesarias
RUN pip install flask flask-restful flask-jsonpify pymongo

COPY contenedores/server.py /server

ENTRYPOINT ["python","server.py"]

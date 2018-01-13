FROM geowa4/coreos-toolbox

MAINTAINER Ramón Gago Carrera <ramongagocarrera@gmail.com>

WORKDIR /microservice

RUN apk --update add python py-pip

RUN pip install flask flask-restful flask-jsonpify pymongo

COPY microservice.py /microservice

ENTRYPOINT python microservice.py

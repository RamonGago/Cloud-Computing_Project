# Hito 2 - Create provisioning

### Tras la creación de una máquina virtual [Ubuntu Server 16.04.3 LTS](https://www.ubuntu.com/download/server) desplegada en [Azure](https://azure.microsoft.com/es-es/), se propone el provisionamiento de la misma con [Ansible](https://www.ansible.com/)

Para instalar **Ansible** en la máquina, se debe instalar en primer lugar **Python** (si no lo está):
```
sudo apt-get install python
```
Y una vez realizado ya se podrá instalar **Ansible**:
```
sudo pip install ansible
```
El siguiente paso será añadir la máquina virtual al archivo **/etc/ansible/hosts**:
```
[virtualubuntu]
52.226.128.247
```
Para realizar el playbook del provisionamiento se han programado las tareas que se realizarán en el mismo:
```
---
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
A continuación se crea el playbook para el provisionamiento con las tareas dentro del directorio **common**:
```
---
- hosts: virtualubuntu
  user: rgcarrera
  sudo: yes
  roles:
  - common
```
Y por último se ejecuta:
```
ansible-playbook /etc/ansible/provision.yml
```

![alt text](/provision/ansible/images/provisioning.png "Provisioning")

#!/bin/bash

# Set project name
PROJECT_NAME="ansible-project"

# Define directory structure
mkdir -p $PROJECT_NAME/{inventory,roles/apache/{tasks,handlers,templates,files,vars,defaults},roles/common/tasks}

# Create files
touch $PROJECT_NAME/ansible.cfg
touch $PROJECT_NAME/inventory/hosts
touch $PROJECT_NAME/main.yml

# Apache role
touch $PROJECT_NAME/roles/apache/tasks/main.yml
touch $PROJECT_NAME/roles/apache/handlers/main.yml
touch $PROJECT_NAME/roles/apache/templates/apache.conf.j2
touch $PROJECT_NAME/roles/apache/files/index.html
touch $PROJECT_NAME/roles/apache/vars/main.yml
touch $PROJECT_NAME/roles/apache/defaults/main.yml

# Common role
touch $PROJECT_NAME/roles/common/tasks/main.yml

# Optional: Add placeholders in files
echo "[defaults]" > $PROJECT_NAME/ansible.cfg
echo "inventory = inventory/hosts" >> $PROJECT_NAME/ansible.cfg
echo "roles_path = ./roles" >> $PROJECT_NAME/ansible.cfg

echo "[web]" > $PROJECT_NAME/inventory/hosts
echo "webserver1 ansible_host=192.168.1.10" >> $PROJECT_NAME/inventory/hosts
echo "webserver2 ansible_host=192.168.1.11" >> $PROJECT_NAME/inventory/hosts

echo "- name: Configure Web Servers" > $PROJECT_NAME/main.yml
echo "  hosts: web" >> $PROJECT_NAME/main.yml
echo "  become: true" >> $PROJECT_NAME/main.yml
echo "  roles:" >> $PROJECT_NAME/main.yml
echo "    - common" >> $PROJECT_NAME/main.yml
echo "    - apache" >> $PROJECT_NAME/main.yml

echo "Directory structure for '$PROJECT_NAME' created successfully."


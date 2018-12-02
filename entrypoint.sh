#!/bin/sh

if [ ! -z "$(cat /etc/os-release | grep ID_LIKE | grep debian)" ] ;
then
    echo "found Debian"
    apt update
    apt install -y git git-core python python-dev python-pip
    pip install ansible
    git clone https://github.com/backenddeveloper/configuration
    ansible-playbook configuration/packages.yml
fi
if [ ! -z "$(cat /etc/os-release | grep ID_LIKE | grep centos)" ] ;
then
    echo "found CentOS"
fi

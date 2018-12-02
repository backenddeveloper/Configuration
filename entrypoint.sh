#!/bin/bash

set +e
set +x
set +u

if [ ! -z "$(cat /etc/os-release | grep mint)" ] ;
then
    echo "found Debian"
    apt update
    apt install -y git git-core python python-dev python-pip
    pip install ansible
    git clone https://github.com/backenddeveloper/configuration
    ansible-playbook configuration/packages.yml
fi

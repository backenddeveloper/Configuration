#!/bin/bash

set +e
set +x
set +u

sudo su

if [ ! -z "$(cat /etc/os-release | grep mint)" ] ;
then
    echo "found mint"
    apt update
    apt install -y git git-core python python-dev python-pip
    pip install ansible
    ansible-playbook packages.yml
fi

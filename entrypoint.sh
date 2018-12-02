#!/bin/bash

set +e
set +x
set +u

username="$(whoami)"

sudo -u root bash <<HEREDOC

if [ ! -z "$(cat /etc/os-release | grep mint)" ] ;
then
    echo "found mint"
    apt update
    apt install -y git git-core python python-dev python-pip
    pip install wheel ansible
    ansible-playbook -e username=${username} packages.yml
fi

HEREDOC

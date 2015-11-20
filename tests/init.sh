#!/bin/bash

export PYTHONUNBUFFERED=1
export ANSIBLE_FORCE_COLOR=1
export DEBIAN_FRONTEND=noninteractive

if ! which ansible &>/dev/null; then
    if which dnf &>/dev/null; then
        echo "Installing Ansible"
        dnf install -q -y ansible python-dnf >/dev/null || exit 1
    else
        echo "Add APT repository"
        apt-get install -qq software-properties-common >/dev/null || exit 1
        apt-add-repository ppa:ansible/ansible >/dev/null || exit 1

        apt-get update -qq >/dev/null

        echo "Installing Ansible"
        apt-get install -qq ansible >/dev/null || exit 1
    fi
fi


cd /vagrant/ansible-role-powerline/tests

echo "127.0.0.1" > /etc/ansible/hosts
echo "localhost" > /etc/ansible/inventory
echo -e "[defaults]\nroles_path = /vagrant" > /etc/ansible/ansible.cfg

. test.sh

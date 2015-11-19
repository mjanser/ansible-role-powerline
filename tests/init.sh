#!/bin/bash

export PYTHONUNBUFFERED=1
export ANSIBLE_FORCE_COLOR=1
export DEBIAN_FRONTEND=noninteractive

if ! which ansible >/dev/null; then
    echo "Add APT repository"
    apt-get install -qq software-properties-common &> /dev/null || exit 1
    apt-add-repository ppa:ansible/ansible &> /dev/null || exit 1

    apt-get update -qq

    echo "Installing Ansible"
    apt-get install -qq python-mysqldb ansible &> /dev/null || exit 1
fi


cd /vagrant/ansible-role-powerline/tests

echo "127.0.0.1" > /etc/ansible/hosts
echo "localhost" > /etc/ansible/inventory
echo -e "[defaults]\nroles_path = /vagrant" > /etc/ansible/ansible.cfg

. test.sh

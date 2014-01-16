#!/bin/bash

# You must make sure your AWS credentials are exported as environment variables
# for the ec2.py dynamic inventory file to work

if [ $# -eq 0 ] ; then
    echo "Please provide the group name for the machines to bootstrap"
    echo "Example usage: $0 security_group_cdh-cluster"
    exit 1
fi

export ANSIBLE_HOST_KEY_CHECKING=False

cd `dirname $0`  # to ensure ansible.cfg is picked up and relative paths are correct
ansible-playbook -v -i ../ec2.py -u ubuntu bootstrap.yml --extra-vars "cluster_group=$1"

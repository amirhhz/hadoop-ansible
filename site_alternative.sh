#!/bin/bash

IFS=$','

export ANSIBLE_ERROR_ON_UNDEFINED_VARS=True
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_SSH_ARGS="-o ForwardAgent=yes"

if [ $# -gt 0 ]
then
  echo 'Running ansible-playbook -i hosts rangespan.yml --tags' "$*"
  ansible-playbook -i hosts --extra-vars "accelerate=false" site_alternative.yml --tags "$*"
else
  echo 'Running ansible-playbook -i hosts rangespan.yml'
  ansible-playbook -i hosts --extra-vars "accelerate=false" site_alternative.yml
fi

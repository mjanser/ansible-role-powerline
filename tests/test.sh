#!/bin/bash

ansible-playbook playbook.yml --syntax-check || exit 1

ansible-playbook playbook.yml --connection=local || exit 1

ansible-playbook playbook.yml --connection=local | tee /tmp/idempotence.log
grep -q "changed=0.*failed=0" /tmp/idempotence.log \
    && (echo "Idempotence test: pass" && exit 0) \
    || (echo "Idempotence test: fail" && exit 1)

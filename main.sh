#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

rm -f teardown.sh
rm -f hosts.txt
rm -f ansible_hosts.cfg

source main.config.sh
source shell-scripts/create_ansible_config.sh
source shell-scripts/helpers.sh

if [ "$CLOUD_PROVIDER" == "DIGITAL_OCEAN" ]; then source shell-scripts/cloud-providers/digital-ocean.sh;
elif [ "$CLOUD_PROVIDER" == "HETZNER_CLOUD" ]; then source shell-scripts/cloud-providers/hetzner-cloud.sh;
fi

provision_servers

create_ansible_config

ansible-playbook playbooks/main.yml -i ansible_hosts.cfg

if [ $? -eq 0 ]; then
    MESSAGE="Cluster setup complete"
else
    MESSAGE="Cluster setup failed"
fi

alert_notice

cat hosts.txt

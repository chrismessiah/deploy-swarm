create_ansible_config () {
  cat <<EOT >> ansible_hosts.cfg
[all:vars]
ansible_python_interpreter=/usr/bin/python3
manager_public_ip=$MANAGER_PUBLIC_IP
docker_version=$DOCKER_VERSION
nodes=$NODES
EOT

}

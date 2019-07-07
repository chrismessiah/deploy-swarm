create_ansible_config () {
  cat <<EOT >> ansible_hosts.cfg
[all:vars]
ansible_python_interpreter=/usr/bin/python3
manager_public_ip=$MANAGER_PUBLIC_IP
docker_version=$DOCKER_VERSION
nodes=$NODES
EOT

  [ ! -z "$USE_NIP_DOMAIN" ] && echo "use_nip_domain=$USE_NIP_DOMAIN" >> ansible_hosts.cfg
  [ ! -z "$GITLAB_REGISTRATION_TOKEN" ] && echo "gitlab_registration_token=$GITLAB_REGISTRATION_TOKEN" >> ansible_hosts.cfg
}

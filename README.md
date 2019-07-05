# Deploy Docker Swarm

```sh
docker node ls

docker run -it --rm ubuntu:18.04 /bin/bash

docker network create -d overlay --attachable ovnet1
docker network create -d overlay --attachable --opt encrypted ovnet2

docker service create --name hello-world --network ovnet1 chrismessiah/hello-world

# publishes the port on ALL SWARM NODES
docker service create --name my-nginx --publish 8080:80 --replicas 2 nginx

# publishes the port on THE HOST(S)
docker service create --name my-nginx --publish mode=host,target=80,published=8080 --replicas 2 nginx

docker service rm hello-world

docker service ls
docker service ps my-web1
docker service scale my-web1=3
```

## Networking 101

```sh
# Resolve containers locally by --name on user-defined networks
docker network create dnet1
docker run -d --name my-nginx --net dnet1 nginx
docker run -it --rm --net dnet1 ubuntu:18.04 /bin/bash
-# curl my-nginx

# Resolve containers across swarm by --name on user-defined OVERLAY networks
docker network create -d overlay --attachable ovnet1
docker service create --name my-nginx2 --network ovnet1 -e constraint:node==node1 nginx
docker run -it --rm --network ovnet1 ubuntu:18.04 /bin/bash
-# curl my-nginx2
```

### Overlay networks

When you initialize a swarm or join a Docker host to an existing swarm, two new networks are created on that Docker host:

- an overlay network called `ingress`, which handles control and data traffic related to swarm services. When you create a swarm service and do not connect it to a user-defined overlay network, it connects to the `ingress` network by default.
- a bridge network called `docker_gwbridge`, which connects the individual Docker daemon to the other daemons participating in the swarm.

You can create user-defined `overlay` networks using `docker network create`, in the same way that you can create user-defined `bridge` networks.

```sh
docker network create -d overlay my-overlay

# To create an overlay network which can be used by swarm services or standalone
# containers to communicate with other standalone containers running on other
# Docker daemons, add the --attachable flag
docker network create -d overlay --attachable my-overlay

# To encrypt application data as well, add --opt encrypted when creating the
# overlay network. This enables IPSEC encryption at the level of the vxlan. This
# encryption imposes a non-negligible performance penalty, so you should test
# this option before using it in production.
docker network create --opt encrypted -d overlay --attachable my-overlay
```

# Certbot

```sh
certbot --nginx --register-unsafely-without-email --agree-tos -d 209.97.189.31.nip.io

# The following folder contains symbolic links to the files
ls /etc/letsencrypt/live/209.97.189.31.nip.io/
  cert.pem
  chain.pem
  fullchain.pem # ssl_certificate in NGINX config
  privkey.pem # ssl_certificate_key in NGINX config


/etc/letsencrypt/ssl-dhparams.pem
```


# Deploying

```sh
docker build -t nginx-cert .
docker run -d --name nginx-cert nginx-cert
```

# Using the template

```
pystache "$(cat template.conf.nginx)" site1.json >> site1.conf
pystache "$(cat template.conf.nginx)" '{"domain":"foo.com","internal_url":"http://hello-world"}' >> site1.conf
```

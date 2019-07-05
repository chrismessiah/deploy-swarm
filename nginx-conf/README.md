
# Using the template

```
pystache "$(cat template.conf.nginx)" site1.json >> site1.conf
pystache "$(cat template.conf.nginx)" '{"domain":"foo.com"}' >> site1.conf
```

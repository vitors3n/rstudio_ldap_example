#!/bin/bash
docker run -d -p 8787:8787 \
-e BASE="dc=example,dc=org" \
-e URI="ldap://example.log" \
-e BIND_DN="cn=admin,dc=example,dc=org" \
-e BIND_PW="senha_admin" \
-e TLS_CERT="/etc/ssl/certs/ca-certificates.crt" \
-v /home:/home \
--name rstudio-ldap rstudio-ldap
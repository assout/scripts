#!/bin/sh -ue
# Refs: http://mikeda.hatenablog.com/entry/20120226/1330250904

simple() {
  DOCUMENT_ROOT=testloot
  DOMAIN=testdomain

  cat <<END
  <VirtualHost *:80>
  ServerName ${DOMAIN}
  DocumentRoot ${DOCUMENT_ROOT}

  <Directory ${DOCUMENT_ROOT}>
  Order deny,allow
  Allow From all
  </Directory>
  </VirtualHost>
END
}

simple

#!/bin/bash -e

service ssh start

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/init.sh" ]]; then
  nami_initialize wildfly
  info "Starting wildfly... "
fi

exec tini -- "$@"

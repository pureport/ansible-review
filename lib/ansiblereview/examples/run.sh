#!/bin/bash

if [ \! -e inventory/skel ]; then
  echo "The inventory/skel directory doesn't exist here. Run from ansible root."
  exit 1
fi

find roles -type f | \
  grep -vE '(.gem|.c32|.0|.swp|.tar.gz|.conf.j2)$' | \
  grep -v 'roles/zabbix_host/library/zabbix_template.py' | \
  xargs ansible-review -c ansible-review/config.ini

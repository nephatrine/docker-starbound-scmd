#!/bin/bash

touch /tmp/STARBOUND2

while [[ ! -f ${STEAMAPPDIR}/.ready ]]; do
  /bin/echo "Please run the starbound-install.sh script to install the game."
  /bin/sleep 60
done

if [[ -f ${STEAMAPPDIR}/linux/starbound_server ]]; then
  cd ${STEAMAPPDIR}/linux
  ./starbound_server
fi

while [[ -f ${STEAMAPPDIR}/.updating ]]; do
  /bin/sleep 10
done

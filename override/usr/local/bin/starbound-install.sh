#!/bin/bash

if [ -z "$1" ]; then
  /bin/echo "Please provide your steam login name as the first argument."
  exit
fi

/usr/bin/touch ${STEAMAPPDIR}/.updating

PID=$(pidof ${STEAMAPPDIR}/linux/starbound_server)
if [ -n "$PID" ]; then
  kill "$PID"
fi

${STEAMCMDDIR}/steamcmd.sh +force_install_dir ${STEAMAPPDIR} +login "$1" +app_update ${STEAMAPPID} validate +quit

if [[ -e ${STEAMAPPDIR}/workshop.txt ]]; then
  while read wid; do
    /usr/local/bin/starbound-workshop.sh $wid
  done <${STEAMAPPDIR}/workshop.txt
fi

/usr/bin/touch ${STEAMAPPDIR}/.ready
/bin/rm -f ${STEAMAPPDIR}/.updating

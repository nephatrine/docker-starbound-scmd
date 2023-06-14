#!/bin/bash

if [[ -e ${STEAMAPPDIR}/workshop.txt ]]; then
  while read wid; do
    /usr/local/bin/starbound-workshop.sh $wid
  done <${STEAMAPPDIR}/workshop.txt
fi

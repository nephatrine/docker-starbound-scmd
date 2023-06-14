#!/bin/bash

if [ -z "$1" ]; then
  /bin/echo "Please provide the workshop ID as the first argument."
  exit
fi

echo ${STEAMCMDDIR}/steamcmd.sh +force_install_dir ${STEAMAPPDIR} +login anonymous +workshop_download_item ${STEAMAPPID} $1 +quit
${STEAMCMDDIR}/steamcmd.sh +force_install_dir ${STEAMAPPDIR} +login anonymous +workshop_download_item ${STEAMAPPID} $1 +quit
/bin/ln -fs ${STEAMAPPDIR}/steamapps/workshop/content/211820/$1/contents.pak ${STEAMAPPDIR}/mods/$1.pak

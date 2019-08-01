#!/bin/bash

# Set to true to just see what command
# would be run
DRY_RUN=false

TITLE='MY-TEST-CONTAINER'
IMAGE='MY-IMAGE'
# Local volume to be mapped into the container any time you run it
# usually with config files or whatnot
# Ex MYCONFDIR='/srv/myconfdirs/${TITLE}'
MYCONFDIR=""

# An array of envvars
# Ex. ENVVARS=("SITENAME=my.site.name}" "RUBY_VERSION=2.3.0" "CONTAINER=true")
ENVVARS=()

# Array of ports like (80:80 443:443 3000 8080)
# Can be mapped or unmapped
PORTS=()

# Array of volumes like ("${MYCONFDIR}:/conf")
VOLUMES=()
ENTRYPOINT=""
CMD=""
RESTART=""
DAEMON=false

# The Docker command to use.
# Could be different if including --tlsverify -H "hostname:hostport", etc
DOCKERCMD="docker"
SITENAME=${TITLE}
NAME=${IMAGE}

declare -a ENVVAR_STRING
for envvar in ${ENVVARS[@]} ; do
  ENVVAR_STRING+=("-e ${envvar}")
done

declare -a PORT_STRING
for port in ${PORTS[@]} ; do
  PORT_STRING+=("-p ${port}")
done

declare -a VOLUME_STRING
for volume in ${VOLUMES[@]} ; do
  VOLUME_STRING+=("-v ${volume}")
done

if [[ ! -z $NAME ]] ; then
  NAME_STRING="--name ${NAME}"
fi

if [[ ! -z $RESTART ]] ; then
  RESTART_STRING="--restart ${RESTART}"
fi

if [[ ! -z $ENTRYPOINT ]] ; then
  ENTRYPOINT_STRING="--entrypoint ${ENTRYPOINT}"
fi

if [[ ! -z $CMD ]] ; then
  CMD_STRING="${CMD}"
fi

if $DAEMON ; then
  DAEMON_STRING='-d'
else
  DAEMON_STRING='-it'
fi

if $DOCKERCMD ps -a | awk "/${NAME}/ {print $NF}" | grep $NAME &>/dev/null ; then
  $DOCKERCMD stop $NAME 1>/dev/null \
  && $DOCKERCMD rm $NAME 1>/dev/null
fi

OPTS="${ENVVAR_STRING[@]} ${PORT_STRING[@]} ${VOLUME_STRING[@]} $NAME_STRING $RESTART_STRING $ENTRYPOINT_STRING"

THE_COMMAND="$DOCKERCMD run $OPTS $DAEMON_STRING $IMAGE $CMD_STRING"
if $DRY_RUN ; then
  echo "$THE_COMMAND"
  exit 0
else
  echo "$THE_COMMAND"
  exec $THE_COMMAND
fi

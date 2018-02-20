#!/bin/bash

cd "$(dirname "$0")"

. .rab.auth

TYPE_OF_CHECK=$1
METRIC=$2
NODE=$3

if [[ -z "$HOSTNAME" ]]; then
    HOSTNAME=`hostname`
fi
if [[ -z "$NODE" ]]; then
    NODE=`hostname`
fi

python /etc/zabbix/scripts/rabbitmq/api.py --hostname=$HOSTNAME --username=$USERNAME --password=$PASSWORD --check=$TYPE_OF_CHECK --metric=$METRIC --node="$NODE" --filters="$FILTER" --conf=$CONF  --loglevel=${LOGLEVEL} --logfile=${LOGFILE} --port=$PORT --protocol=$PROTOCOL

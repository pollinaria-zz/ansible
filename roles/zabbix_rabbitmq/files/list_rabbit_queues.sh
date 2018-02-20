#!/bin/bash

cd "$(dirname "$0")"
. .rab.auth

if [[ -z "$HOSTNAME" ]]; then
    HOSTNAME=`hostname`
fi
if [[ -z "$NODE" ]]; then
    NODE=`hostname`
fi

python /etc/zabbix/scripts/rabbitmq/api.py --username=$USERNAME --password=$PASSWORD --check=list_queues --filter="$FILTER" --conf=$CONF --hostname=$HOSTNAME --node="$NODE"  --loglevel=${LOGLEVEL} --logfile=${LOGFILE} --port=$PORT --protocol=$PROTOCOL

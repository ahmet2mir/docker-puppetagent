#!/bin/bash

PUPPETSERVER=${PUPPETSERVER:-localhost}

env > /tmp/env

# if linked container
if [[ $DB_1_PORT_3306_TCP_ADDR ]]; then
    PUPPETSERVER=${DB_1_PORT_3306_TCP_ADDR}
fi

# If the container stop, don't run this part
# docker start will run this script
if [ ! -f /.docker_status ]
then
	echo "172.17.42.1 "$PUPPETSERVER >> /etc/hosts
    sed 's,{{PUPPETSERVER}},'"${PUPPETSERVER}"',g' -i /etc/puppet/puppet.conf

    echo "************ Create status file to be idempotent"
    echo "done" > /.docker_status
fi

echo "************ Finished."
exec tail -f /var/log/dmesg

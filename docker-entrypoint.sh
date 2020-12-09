#!/bin/sh

# deploy the given .pub keys to let the authenticat work
if [ -d /root/.ssh/keys ]; then
    cat /root/.ssh/keys/*.pub > /root/.ssh/authorized_keys
fi

# generate the ssh keys for the server
ssh-keygen -A

# so we can understand connection issues using /var/log/messages
echo "Start logging server"
syslogd&

echo "starting server"
exec /usr/sbin/sshd -D "$@"

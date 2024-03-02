#!/bin/sh

# Taken from mobian-recipes, modified for Plebian

USERNAME=$1
[ "$USERNAME" ] || exit 1
PASSWORD=$2
[ "$PASSWORD" ] || exit 1

adduser --gecos "$USERNAME" --disabled-password --shell /bin/bash "$USERNAME"
adduser "$USERNAME" sudo

# Needed for hardware access rights
adduser "$USERNAME" video
adduser "$USERNAME" render
adduser "$USERNAME" audio
adduser "$USERNAME" bluetooth
adduser "$USERNAME" plugdev
adduser "$USERNAME" input
adduser "$USERNAME" dialout

echo "$USERNAME:$PASSWORD" | chpasswd
echo "root:$PASSWORD" | chpasswd
mkdir -p /root/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhliRuQRk7kbxIG/VIlHFsSFPfj4DKTylM1rvPjKuzpqj4+5oMoEKaxgK5ocDGofEyLibkY7iZgsv8gdbDD92sP6halbEBkvq4faFn2ziPUNI+w73n3kUdZUqccl/E8hgExyescOF1QCbeL7empRPiVSxHYTZBwa7e9+JtDbgJlWLHJjich+3AAhR9wMM7kTCpvbJI6kPDIoODwgbxGUxRkjsrv3Y1du+Hj6liFvtB8xUO7yg5W+2h09TRttnoQsgaZJ6T141vWkdbHBbjxRF5LV4CE2/3j0CfikecxS+lFEGB8QLsOCL+PlbsLHgoMZE4j0mJfu6JpinCoPBDW1xH/E+tRdvJK4OcVw2h9ZPIRFx/coBcfqACibG96Vs+DNnavEaQJo3N1Lq7WMSdKFssPn+euqN6T7zHS0K2QizYvOXcfsttSdSmi5nVd4Du+Q7gY/s9Ia4CADorSnLsGHnDMJb4fGKqRQfR7okkU/lADqdkv7humW4hpa6JzvWuZG0= adminy@MacBook-Pro.local' > /root/.ssh/authorized_keys

#!/bin/sh
# The Standard System Utilities task that one sees in debian-installer
# consist of packages with priority 'required', 'important' and 'standard'.
# One can safely assume that 'required' packages are already installed.

# Install packages with priority 'important'
apt-get install $(dpkg-query -W -f'${Package}\t${Priority}\n' | awk '/important$/ {printf "%s ", $1}')
# Install packages with priority 'standard'
apt-get install $(dpkg-query -W -f'${Package}\t${Priority}\n' | awk '/standard$/ {printf "%s ", $1}')

mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

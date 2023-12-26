#!/bin/bash
# Enable xtrace Debug
set -x

# Opensips repo package sources
sudo sh -c 'curl https://apt.opensips.org/opensips-org.gpg -o /usr/share/keyrings/opensips-org.gpg'
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/opensips-org.gpg] https://apt.opensips.org jammy 3.2-releases" >/etc/apt/sources.list.d/opensips.list'
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/opensips-org.gpg] https://apt.opensips.org jammy cli-nightly" >/etc/apt/sources.list.d/opensips-cli.list'

# Update the system to reflect the new packages
sudo apt-get update -y

# Install OpenSIPS and OpenSIPS CLI
sudo apt install opensips -y
sudo apt install opensips-cli -y
sudo apt install opensips-*  -y # Install all other modules
sudo cp configs/opensips-cli.cfg /etc/opensips/

# sudo cp configs/.opensips-cli.cfg ~

# Enable opensips on startup and lets run it
sudo systemctl enable opensips
sudo systemctl start opensips
sudo systemctl status opensips

# below command is for creating by default mysql database and tables
# opensips-cli -x database create opensips




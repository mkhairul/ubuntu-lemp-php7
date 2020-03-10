#!/bin/bash
# Using Ubuntu


USER=$1
PASS=$2


echo "============    BEGIN INTEGRATING WITH BITBUCKET   ============="
echo -e "----------------------------------------"
cd /home/vagrant/magento
git clone https://${USER}:${PASS}@bitbucket.org/mediaprimadigital/superdeals-magento.git ~/temp
rm -rf .git
mv ~/temp/.git .git
rm -rf ~/temp
git reset --hard HEAD
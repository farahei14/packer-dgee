#!/bin/sh

dev_repo="$HOME/ansible"
remote_repo="https://github.com/farahei14/ansible-dgee"

# install provisioner on master
yum -y install ansible sshpass

# desactive verification de la verification des id d'hote pour le developpement
sed -i -e 's/^#host_key_checking.*$/host_key_checking = False/' /etc/ansible/ansible.cfg

# install vagrant public private_key
wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant -O /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

# install git
yum -y install git

# git clone ansible repository
if ! [ -e ${dev_repo} ]
then
	mkdir $dev_repo && git clone ${remote_repo} ${dev_repo}
fi

# install command man
yum -y install man 
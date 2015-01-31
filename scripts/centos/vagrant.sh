# Set Selinux on permissive
sed -i -e 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config

# add user vagrant and ssh key
useradd vagrant
mkdir -m 0700 -p /home/vagrant/.ssh
curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# allow vagrant to ssh and send sudo command
echo -e "vagrant ALL=(ALL) NOPASSWD: ALL\nDefaults: vagrant !requiretty" > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant


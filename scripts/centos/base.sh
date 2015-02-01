# date la generation de l'image
date > /etc/box_create_time
chmod 700 /etc/box_create_time

yum check-update
yum -y update
yum install -y vim-enhanced
yum install -y bc

# Set Selinux on permissive
sed -i -e 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config

echo "UseDNS no" >> /etc/ssh/sshd_config

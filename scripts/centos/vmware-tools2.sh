# add vmware-tools repository
cat > /etc/yum.repos.d/vmware-tools.repo <<EOF
[vmware-tools]
name=VMware Tools
baseurl=http://packages.vmware.com/tools/esx/latest/rhel6/x86_64
enabled=1
gpgcheck=1
EOF

# import vmware public key
yum -y install wget
wget http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub

rpm --import VMWARE-PACKAGING-GPG-RSA-KEY.pub

# install vmware-tools
yum -y check-update
yum -y install vmware-tools-esx-nox
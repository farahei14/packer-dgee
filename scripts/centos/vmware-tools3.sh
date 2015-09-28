VMWARE_INSTALL_PL="/home/vmware/vmware-tools-distrib/vmware-install.pl"
#VMWARE_REQUIRED_PACKAGES="build-essential"
VMWARE_TOOLS_TMP="/home/vmware"

echo "Installing virtual machine tools for ${PACKER_BUILDER_TYPE}"
echo "Extracting VMWare Tools to /tmp/vmware"
mkdir -p ${VMWARE_TOOLS_TMP}

echo "Extracting /tmp/VMwareTools-*.tar.gz to ${VMWARE_TOOLS_TMP}"
tar xzf /tmp/VMwareTools-*.tar.gz -C ${VMWARE_TOOLS_TMP}

echo "Running ${VMWARE_INSTALL_PL}"
${VMWARE_INSTALL_PL} << EOF
/usr/bin
/etc/rc.d
/etc/rc.d/init.d
/usr/sbin
/usr/lib/vmware-tools
yes
/usr/share/doc/vmware-tools
yes
yes
no
no
yes
EOF

echo "Cleaning up ${VMWARE_TOOLS_ISO} and ${VMWARE_TOOLS_TMP}"
#rm -rf ${VMWARE_TOOLS_TMP}
#rm -fr /tmp/VMwareTools-*.tar.gz
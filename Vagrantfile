# -*- mode: ruby -*-
# vi: set ft=ruby :

# Definit le provider par défaut
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'vmware_workstation'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  # Definition de la machine (multiple machine)
  config.vm.define :master do |master|
    master.vm.box = "centos6"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

    # configure le nom de la machine
    master.vm.hostname = "master.education.lan"

    # configure une carte réseau
    master.vm.network "private_network", ip: "192.168.200.41", virtualbox__intnet: true

    master.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=775","fmode=664"]

    master.ssh.insert_key = false
    

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
    master.vm.provider "virtualbox" do |vb|
      # Active la partie graphique de la vm. Si innactif, la vm
      # fonctionnera en background
      #vb.gui = true
      vb.name = "master"
      vb.memory = "512"
      vb.cpus = "1"
    end

    master.vm.provider "vmware_workstation" do |vw|
      # Active la partie graphique de la vm. Si innactif, la vm
      # fonctionnera en background
      #vb.gui = true
      vw.name = "master"
      vw.memory = "512"
      vw.cpus = "1"
    end
  
  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  master.vm.provision "shell", path: "provision/ansible.sh"

  end

  config.vm.define :client do |client|
    client.vm.box = "centos6"

    # configure le nom de la machine
    client.vm.hostname = "client.education.lan"

    # configure une carte réseau
    client.vm.network "private_network", ip: "192.168.200.42", virtualbox__intnet: true

    client.ssh.insert_key = false

    # desactive le partage
    client.vm.synced_folder ".", "/vagrant", disabled: true
 
    client.vm.provider "virtualbox" do |vb|
      vb.name = "client"
      vb.memory = "512"
      vb.cpus = "1"
    end

    client.vm.provider "vmware_workstation" do |vw|
      vw.name = "client"
      vw.memory = "512"
      vw.cpus = "1"
    end
    
  end

config.vm.define :client2 do |client2|
    client2.vm.box = "centos6"

    # configure le nom de la machine
    client2.vm.hostname = "client2.education.lan"

    # configure une carte réseau
    client2.vm.network "private_network", ip: "192.168.200.43", virtualbox__intnet: true

    client2.ssh.insert_key = false

    # desactive le partage
    client2.vm.synced_folder ".", "/vagrant", disabled: true
    
    client2.vm.provider "virtualbox" do |vb|
      vb.name = "client2"
      vb.memory = "512"
      vb.cpus = "1"
    end

    client2.vm.provider "vmware_workstation" do |vw|
      vw.name = "client2"
      vw.memory = "512"
      vw.cpus = "1"
    end
  
  end

end
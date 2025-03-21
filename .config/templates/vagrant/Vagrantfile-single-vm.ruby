# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.box_version = "202404.26.0"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.ssh.insert_key = false

  # Setup hostmanager plugin to enable DNS for VM.
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.include_offline = true
  config.hostmanager.ignore_private_ip = false

  # A basic provisioning for 1 VM.
  config.vm.provider :vmware_desktop do |vmware|
    vmware.memory = 512
    vmware.cpus = 1
  end

  # A basic VM config - including the host and the priv network.
  # Config manager is not added here.
  config.vm.define "app" do |app|
    web.vm.hostname = "app.test"
    web.vm.network :private_network, ip: "192.168.56.2"
  end
end


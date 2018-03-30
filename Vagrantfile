# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# A dummy plugin for Barge to set hostname and network correctly at the very first `vagrant up`
module VagrantPlugins
  module GuestLinux
    class Plugin < Vagrant.plugin("2")
      guest_capability("linux", "change_host_name") { Cap::ChangeHostName }
      guest_capability("linux", "configure_networks") { Cap::ConfigureNetworks }
    end
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "barge"
  config.vm.box = "ailispaw/barge"
  config.vm.box_check_update = false
  config.vm.synced_folder ".", "/wiki"
  config.vm.hostname = "wiki.local"
  config.vm.network :forwarded_port, guest: 4567, host: 4567
  config.vm.network :forwarded_port, guest: 2375, host: 2375, disabled: true

  config.vm.provider "virtualbox" do |vb|
     # Don't boot with headless mode
     vb.gui = false
  
     # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :docker do |d|
    d.build_image "/wiki",
      args: "-t gollum"
    d.run "wiki",
      image: "gollum",
      args: "-p 4567:80 -v /wiki:/wiki"
  end

  # vagrant-vbguest
  # See https://github.com/dotless-de/vagrant-vbguest
  config.vbguest.auto_update = false
  config.vbguest.no_remote = true
end

# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.require_version ">= 1.6.0"

$ip = ENV['VAGRANT_IP'] || '172.22.22.22'

Vagrant.configure(2) do |config|
    config.vm.box = 'bento/ubuntu-14.04'
    config.vm.synced_folder ".", "/vagrant", disabled: true
    
    config.vm.provider :vmware_fusion do |vw, override|
        override.vm.network :private_network, ip: $ip
    end
    
    config.vm.provider :virtualbox do |vb, override|
        override.vm.network :private_network, ip: $ip
    end

    config.vm.provision :shell, inline: 'sudo apt-get update && sudo apt-get install -y curl nodejs npm postgresql postgresql-contrib libpq-dev postgresql-server-dev-9.3'
    config.vm.provision :shell, inline: 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3' 
    config.vm.provision :shell, inline: 'curl -sSL https://get.rvm.io | bash -s stable --rails'
    config.vm.provision :shell, inline: 'source /usr/local/rvm/scripts/rvm'
    config.vm.provision :shell, inline: 'rvm install 2.3.1'
    config.vm.provision :shell, inline: 'rvm gemset create memmet && rvm 2.3.1@memmet'
    config.vm.provision :shell, inline: 'gem install rails -v 5.0.0'

    config.vm.synced_folder ".", "/opt/src/", type: "nfs"
end

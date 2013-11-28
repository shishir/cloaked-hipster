# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
$script = <<EOF
sudo apt-get update
sudo apt-get -y install vim curl git ffmpeg libboost-dev libtag1-dev zlib1g-dev build-essential g++

if [ ! -d /home/vagrant/echoprint-codegen ]; then
  git clone -b release-4.12 git://github.com/echonest/echoprint-codegen.git;
fi

if [ ! -d /home/vagrant/echoprint-server ]; then
  git clone git://github.com/echonest/echoprint-server.git;
fi


chown -R vagrant:vagrant /home/vagrant/echoprint-codegen
cd /home/vagrant/echoprint-codegen/src && make
EOF

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box     = "precise64"
  config.omnibus.chef_version = :latest
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  #config.vm.box_url = "/Users/amar/Downloads/precise64_squishy_2013-02-09.box" 
  config.vm.provision :shell, inline: $script
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "java"
    chef.add_recipe "echoprint-server"
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end 
end

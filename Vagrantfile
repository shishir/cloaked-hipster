# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "https://s3-us-west-2.amazonaws.com/squishy.vagrant-boxes/precise64_squishy_2013-02-09.box"
  config.vm.provision :shell, inline: "sudo apt-get update"
  config.vm.provision :shell, inline: "sudo apt-get -y install vim curl git ffmpeg libboost-dev libtag1-dev zlib1g-dev build-essential g++"
  config.vm.provision :shell, inline: "git clone -b release-4.12 git://github.com/echonest/echoprint-codegen.git"
end

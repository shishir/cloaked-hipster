maintainer       "Shishir Das"
maintainer_email "shishir.das@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures echo print server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe           "echoprint-server", "Installs/Configures echoprint-server"

%w{ centos debian ubuntu }.each do |os|
  supports os
end

depends "java"

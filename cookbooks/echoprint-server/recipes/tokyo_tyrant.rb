include_recipe "echoprint-server::tokyo_cabinet"

remote_file "/tmp/tokyotyrant-1.1.33.tar.gz" do
  source "http://sourceforge.net/projects/tokyocabinet/files/tokyotyrant/1.1.33/tokyotyrant-1.1.33.tar.gz"
end

bash "make and install tokyo tyrant" do
  cwd "/tmp"
  code <<EOF
    tar -xvf tokyotyrant-1.1.33.tar.gz
    mkdir -p /usr/local/tokyotyrant-1.1.33
    cd tokyotyrant-1.1.33 && ./configure --prefix=/usr/local/tokyotyrant-1.1.33/ --with-tc=/usr/local/tokyocabinet-1.4.32/ && make && make install
    cd /usr/local/tokyotyrant-1.1.33/ && ln -s /usr/local/tokyocabinet-1.4.32/lib/libtokyocabinet.so.8 lib/
EOF
  not_if { ::File.exists?("/usr/local/tokyotyrant-1.1.33") }
end



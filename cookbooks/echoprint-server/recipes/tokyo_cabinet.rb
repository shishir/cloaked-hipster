file_name = "tokyocabinet-1.4.32.tar.gz"
remote_file "/tmp/tokyocabinet-1.4.32.tar.gz" do
  source "http://sourceforge.net/projects/tokyocabinet/files/tokyocabinet/1.4.32/#{file_name}"
end

%w{ zlib1g-dev libbz2-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

bash "make and install tokyo cabinet" do
  cwd "/tmp"
  code <<EOF
    tar -xvf tokyocabinet-1.4.32.tar.gz
    mkdir -p /usr/local/tokyocabinet-1.4.32/
    cd tokyocabinet-1.4.32 && ./configure --prefix="/usr/local/tokyocabinet-1.4.32/" && make && make install
EOF
end

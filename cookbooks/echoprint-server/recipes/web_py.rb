remote_file "/tmp//web.py-0.37.tar.gz" do
  source "http://webpy.org/static/web.py-0.37.tar.gz"
  user "vagrant"
  group "vagrant"
  mode 0744
end

bash "install web py" do
  cwd "/tmp"
  code <<EOF
    tar -xvf web.py-0.37.tar.gz
    cd web.py-0.37 && python setup.py install
EOF
end

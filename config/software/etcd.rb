name "etcd"
default_version "v3.2.4"
gem_version = "0.3.0"

dependency "openssl"
dependency "ruby"
dependency "rubygems"

source :url => "http://192.168.206.107/software/etcd-#{version}-linux-amd64.tar.gz",
       :md5 => "d1e92766a20439cc475d46e8024fdf7c"

relative_path "etcd-#{version}-linux-amd64"

build do
  copy "#{project_dir}/etcdctl", "#{install_dir}/embedded/bin"
  copy "#{project_dir}/etcd", "#{install_dir}/embedded/sbin"

  gem "install etcd -n #{install_dir}/embedded/bin --no-document -v #{gem_version}"
end

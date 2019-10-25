name "authbind"
default_version "2.1.1"

version "2.1.1" do
  source md5: "ef3cd5eef28519b8daf248e3761dd9bd"
end

source url: "http://192.168.206.107/software/authbind_#{version}.tar.gz"

relative_path "authbind-#{version}"
env = with_standard_compiler_flags()

build do
  command "make -j #{workers} prefix=#{install_dir}/embedded", :env => env
  command "make install prefix=#{install_dir}/embedded", :env => env
end

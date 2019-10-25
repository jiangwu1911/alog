name 'graylog'
maintainer 'Marius Sturm'
homepage 'https://graylog.org'

install_dir     '/opt/graylog'
#build_version   '2.3.0'
build_version   '3.1.2'
build_iteration  3

conflict 'graylog-server'

override :ruby,       version: "2.5.5",
                      source: { 
                        url: "http://192.168.206.107/software/ruby-2.5.5.tar.gz",
                        md5: "7e156fb526b8f4bb1b30a3dd8a7ce400" }
override :'chef-gem', version: "12.6.0"
override :'openssl',  version: "1.0.2l",
                      source: {
                        url: "https://www.openssl.org/source/openssl-1.0.2l.tar.gz",
                        md5: "f85123cd390e864dfbe517e7616e6566" }
override :'cacerts',  version: "2017-01-18",
                      source: {
                        url: "https://curl.haxx.se/ca/cacert-2017-06-07.pem",
                        md5: "9d8c2e9a93881cdf1f2a7fc3d01a6318" }

dependency "prepare"
dependency "chef-gem"
dependency "runit"
dependency "jdk"
dependency "elasticsearch"
dependency "mongodb"
dependency "nginx"
dependency "etcd"
dependency "graylog-server"
dependency "graylog-ctl"
dependency "graylog-cookbooks"
dependency "post-install"
if linux?
  dependency "authbind"
end

exclude '\.git*'
exclude 'bundler\/git'

package_user 'root'
package_group 'root'

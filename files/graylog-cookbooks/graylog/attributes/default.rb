node.default['graylog'] ||= {}
node.default['mongodb'] ||= {}

# General
default['graylog']['major_version']     = '3.1'
default['graylog']['server']['version'] = '3.1.1-1'
default['graylog']['install_enterprise_plugins']   = true
default['graylog']['install_enterprise_integrations_plugins'] = true
default['graylog']['install_integrations_plugins'] = true

## By default the cookbook installs a meta package containing the key and URL for the current Graylog repository. To disable
## this behavior set your own repository informations here.
default['graylog']['server']['repos']   = {
  # 'rhel' => {
  #   'url' => "https://packages.graylog2.org/repo/el/stable/#{node['graylog']['major_version']}/x86_64/",
  #   'key' => 'https://raw.githubusercontent.com/Graylog2/fpm-recipes/master/recipes/graylog-repository/files/rpm/RPM-GPG-KEY-graylog'
  # },
  # 'debian' => {
  #   'url' => "https://packages.graylog2.org/repo/debian/",
  #   'distribution' => '',
  #   'components' => ['stable', node['graylog']['major_version']],
  #   'key' => 'https://raw.githubusercontent.com/Graylog2/fpm-recipes/master/recipes/graylog-repository/files/deb/graylog-keyring.gpg'
  # }
}
default['graylog']['root_username']                       = 'admin'
default['graylog']['root_email']                          = nil
default['graylog']['root_timezone']                       = 'Asia/Shanghai'
default['graylog']['restart']                             = 'delayed'
default['graylog']['no_retention']                        = nil
default['graylog']['disable_sigar']                       = nil
default['graylog']['dashboard_widget_default_cache_time'] = '10s'
default['graylog']['secrets_data_bag']                    = 'secrets'
default['graylog']['secrets_data_bag_item']               = 'graylog'

# Users
default['graylog']['user']['username']  = 'graylog'
default['graylog']['user']['group'] = 'graylog'
default['graylog']['user']['uid'] = nil
default['graylog']['user']['gid'] = nil
default['graylog']['user']['shell'] = "/bin/sh"
default['graylog']['user']['home'] = "/var/opt/graylog"

# SHAs
default['graylog']['password_secret']              = 'bGDuLKSCvd0MUWd4dw1Be1PR0CMaXhZVVUjBJyEmnEfVkigzEYR9aWYfVqZaaJhfUn6MqeqpInWEklPPPZqyalnUMt11e64c'
default['graylog']['password_secret_enclose_char'] = '"'
default['graylog']['root_password_sha2']           = 'e9cee71ab932fde863338d08be4de9dfe39ea049bdafb342ce659ec5450b69ae'

# Paths
default['graylog']['node_id_file']        = '/var/opt/graylog/graylog-server-node-id'
default['graylog']['plugin_dir']          = '/opt/graylog/plugin'
default['graylog']['bin_dir']             = '/opt/graylog/server/bin/'
default['graylog']['data_dir']            = '/var/opt/graylog/data'
default['graylog']['message_journal_dir'] = '/var/opt/graylog/journal'

# Network
default['graylog']['trusted_proxies']                    = nil
default['graylog']['http_proxy_uri']                     = nil
default['graylog']['non_proxy_hosts']                    = nil
default['graylog']['proxied_requests_thread_pool_size']  = 32
default['graylog']['authorized_ports']                   = 514

# HTTP interface
default['graylog']['http']['bind_address'] = '0.0.0.0:9000'
default['graylog']['http']['publish_uri'] = nil
default['graylog']['http']['external_uri'] = nil
default['graylog']['http']['enable_cors'] = nil
default['graylog']['http']['enable_gzip'] = nil
default['graylog']['http']['max_header_size'] = nil
default['graylog']['http']['thread_pool_size'] = nil
default['graylog']['http']['enable_tls'] = nil
default['graylog']['http']['tls_cert_file'] = nil
default['graylog']['http']['tls_key_file'] = nil
default['graylog']['http']['tls_key_password'] = nil

# Elasticsearch
# Elasticsearch http client (GL >= 2.3)
default['graylog']['elasticsearch']['hosts']                           = 'http://127.0.0.1:9200'
default['graylog']['elasticsearch']['max_total_connections']           = 20
default['graylog']['elasticsearch']['max_total_connections_per_route'] = 2
default['graylog']['elasticsearch']['max_retries']                     = 2
# WARNING: Automatic node discovery does not work if Elasticsearch requires authentication, e. g. with Shield.
default['graylog']['elasticsearch']['discovery_enabled']               = true
default['graylog']['elasticsearch']['discovery_filter']                = nil
default['graylog']['elasticsearch']['discovery_frequency']             = nil # '30s'
default['graylog']['elasticsearch']['compression_enabled']             = nil # true

# Optional node discovery by Chef search
default['graylog']['elasticsearch']['node_search_query']                    = nil
default['graylog']['elasticsearch']['node_search_attribute']                = nil
default['graylog']['elasticsearch']['node_search_protocol']                 = 'http'

default['graylog']['elasticsearch']['index_prefix']                         = 'graylog'
default['graylog']['elasticsearch']['analyzer']                             = 'standard'
default['graylog']['elasticsearch']['output_batch_size']                    = 500
default['graylog']['elasticsearch']['output_flush_interval']                = 1
default['graylog']['elasticsearch']['output_fault_count_threshold']         = 5
default['graylog']['elasticsearch']['output_fault_penalty_seconds']         = 30
default['graylog']['elasticsearch']['disable_version_check']                = nil
default['graylog']['elasticsearch']['disable_index_optimization']           = nil
default['graylog']['elasticsearch']['index_optimization_jobs']              = nil
default['graylog']['elasticsearch']['index_optimization_max_num_segments']  = nil
default['graylog']['elasticsearch']['index_ranges_cleanup_interval']        = nil
default['graylog']['elasticsearch']['index_field_type_periodical_interval'] = nil
default['graylog']['elasticsearch']['template_name']                        = nil


# MongoDb
default['graylog']['mongodb']['uri'] = 'mongodb://127.0.0.1:27017/graylog'
default['graylog']['mongodb']['max_connections'] = 100
default['graylog']['mongodb']['threads_allowed_to_block_multiplier'] = 5

# Search
default['graylog']['allow_leading_wildcard_searches'] = false
default['graylog']['allow_highlighting']              = false

# Streams
default['graylog']['stream_processing_max_faults'] = 3

# Buffer
default['graylog']['processbuffer_processors']  = 5
default['graylog']['outputbuffer_processors']   = 3
default['graylog']['async_eventbus_processors'] = 2
default['graylog']['outputbuffer_processor_keep_alive_time']        = 5000
default['graylog']['outputbuffer_processor_threads_core_pool_size'] = 3
default['graylog']['outputbuffer_processor_threads_max_pool_size']  = 30
default['graylog']['processor_wait_strategy']   = 'blocking'
default['graylog']['ring_size']                 = 65536
default['graylog']['udp_recvbuffer_sizes']      = 1048576
default['graylog']['inputbuffer_ring_size']     = 65536
default['graylog']['inputbuffer_processors']    = 2
default['graylog']['inputbuffer_wait_strategy'] = 'blocking'

# Message journal
default['graylog']['message_journal_enabled']        = true
default['graylog']['message_journal_max_age']        = '12h'
default['graylog']['message_journal_max_size']       = '5gb'
default['graylog']['message_journal_flush_age']      = '1m'
default['graylog']['message_journal_flush_interval'] = 1000000
default['graylog']['message_journal_segment_age']    = '1h'
default['graylog']['message_journal_segment_size']   = '100mb'

# Timeouts
default['graylog']['elasticsearch']['connect_timeout']                 = nil # '10s'
default['graylog']['elasticsearch']['socket_timeout']                  = nil # '60s'
default['graylog']['elasticsearch']['idle_timeout']                    = nil # '-1s'
default['graylog']['elasticsearch']['index_optimization_timeout']      = nil # '1h'
default['graylog']['output_module_timeout']                            = 10000
default['graylog']['stale_master_timeout']                             = 2000
default['graylog']['shutdown_timeout']                                 = 30000
default['graylog']['stream_processing_timeout']                        = 2000
default['graylog']['ldap_connection_timeout']                          = 2000
default['graylog']['api_client_timeout']                               = 300
default['graylog']['http_connect_timeout']                             = '5s'
default['graylog']['http_read_timeout']                                = '10s'
default['graylog']['http_write_timeout']                               = '10s'

# Intervals
default['graylog']['server']['alert_check_interval'] = nil

# Cluster
default['graylog']['ip_of_master']                     = node['ipaddress']
default['graylog']['lb_recognition_period_seconds']    = 3
default['graylog']['lb_throttle_threshold_percentage'] = 95

# Email transport
default['graylog']['transport_email_enabled']           = false
default['graylog']['transport_email_hostname']          = 'mail.example.com'
default['graylog']['transport_email_port']              = 587
default['graylog']['transport_email_use_auth']          = true
default['graylog']['transport_email_use_tls']           = true
default['graylog']['transport_email_use_ssl']           = false
default['graylog']['transport_email_auth_username']     = 'you@example.com'
default['graylog']['transport_email_auth_password']     = 'secret'
default['graylog']['transport_email_subject_prefix']    = '[graylog]'
default['graylog']['transport_email_from_email']        = 'graylog@example.com'
default['graylog']['transport_email_web_interface_url'] = nil

# Logging
default['graylog']['server']['log_file']              = '/var/log/graylog-server/server.log'
default['graylog']['server']['log_max_size']          = '50MB'
default['graylog']['server']['log_max_index']         = 10
default['graylog']['server']['log_pattern']           = "%d{yyyy-MM-dd'T'HH:mm:ss.SSSXXX} %-5p [%c{1}] %m%n"
default['graylog']['server']['log_level_application'] = 'info'
default['graylog']['server']['log_level_root']        = 'warn'

# JVM
default['graylog']['server']['java_bin'] = '/opt/graylog/embedded/jre/bin/java'
default['graylog']['server']['java_home'] = ''
default['graylog']['server']['java_opts'] = '-Djava.net.preferIPv4Stack=true -Xms1g -Xmx1g -XX:NewRatio=1 -server -XX:+ResizeTLAB -XX:+UseConcMarkSweepGC -XX:+CMSConcurrentMTEnabled -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC -XX:-OmitStackTraceInFastThrow'
default['graylog']['server']['args']      = ''
default['graylog']['server']['wrapper']   = ''
default['graylog']['server']['gc_warning_threshold'] = nil

# Server
default['graylog']['server']['override_restart_command'] = false
default['graylog']['server']['additional_options']       = nil
default['graylog']['server']['additional_env_vars']      = nil
default['graylog']['server']['install_tzdata_java']      = false

# Collector Sidecar
default['graylog']['sidecar']['release']                        = '0.1.4'
default['graylog']['sidecar']['version']                        = '0.1.4'
default['graylog']['sidecar']['build']                          = 1
default['graylog']['sidecar']['arch']                           = 'amd64'
default['graylog']['sidecar']['package_base_url']               = "https://github.com/Graylog2/collector-sidecar/releases/download/#{node['graylog']['sidecar'][:release]}"
default['graylog']['sidecar']['server_url']                     = 'http://localhost:9000/api'
default['graylog']['sidecar']['update_interval']                = 10
default['graylog']['sidecar']['tls_skip_verify']                = false
default['graylog']['sidecar']['send_status']                    = false
default['graylog']['sidecar']['list_log_files']                 = nil # single directory or '[dir1, dir2, dir3]'
default['graylog']['sidecar']['name']                           = 'graylog-collector-sidecar'
default['graylog']['sidecar']['id']                             = 'file:/etc/graylog/collector-sidecar/collector-id'
default['graylog']['sidecar']['log_path']                       = '/var/log/graylog/collector-sidecar'
default['graylog']['sidecar']['log_rotation_time']              = 86400
default['graylog']['sidecar']['log_max_age']                    = 604800
default['graylog']['sidecar']['tags']                           = 'linux' # multiple tags '[tag1, tag2, tag3]'
default['graylog']['sidecar']['cache_path']                     = '/var/cache/graylog/collector-sidecar'
default['graylog']['sidecar']['backends']['nxlog']['enabled']               = false
default['graylog']['sidecar']['backends']['nxlog']['binary_path']           = '/usr/bin/nxlog'
default['graylog']['sidecar']['backends']['nxlog']['configuration_path']    = '/etc/graylog/collector-sidecar/generated/nxlog.conf'
default['graylog']['sidecar']['backends']['filebeat']['enabled']            = true
default['graylog']['sidecar']['backends']['filebeat']['binary_path']        = '/usr/bin/filebeat'
default['graylog']['sidecar']['backends']['filebeat']['configuration_path'] = '/etc/graylog/collector-sidecar/generated/filebeat.yml'
default['graylog']['server']['collector_inactive_threshold']    = '1m'
default['graylog']['server']['collector_expiration_threshold']  = '14d'

# Content packs
default['graylog']['server']['content_packs_loader_enabled'] = false
default['graylog']['server']['content_packs_dir']            = '/opt/graylog/contentpacks'
default['graylog']['server']['content_packs_auto_load']      = 'grok-patterns.json'

# Graylog server
default['graylog']['graylog-server']['enable'] = true
default['graylog']['graylog-server']['memory'] = "1500m"
default['graylog']['graylog-server']['java_opts'] = nil
default['graylog']['install_directory'] = "/opt/graylog"
default['graylog']['graylog-server']['log_directory'] = "/var/log/graylog/server"
default['graylog']['graylog-server']['journal_directory'] = "/var/opt/graylog/data/journal"
default['graylog']['graylog-server']['node_id'] = "/var/opt/graylog/graylog-server-node-id"

# Elasticsearch
default['graylog']['elasticsearch']['enable'] = true
default['graylog']['elasticsearch']['memory'] = nil # defaults to 50% of VM memory
default['graylog']['elasticsearch']['log_directory'] = "/var/log/graylog/elasticsearch"
default['graylog']['elasticsearch']['data_directory'] = "/var/opt/graylog/data/elasticsearch"
default['graylog']['elasticsearch']['cluster_name'] = "graylog"
default['graylog']['elasticsearch']['discovery_zen_ping_timeout'] = "10s"
default['graylog']['elasticsearch']['log_filesize'] = 10000000
default['graylog']['elasticsearch']['log_backup'] = 3

# Mongodb
default['graylog']['mongodb']['enable'] = true
default['graylog']['mongodb']['log_directory'] = "/var/log/graylog/mongodb"
default['graylog']['mongodb']['data_directory'] = "/var/opt/graylog/data/mongodb"

# Nginx
default['graylog']['nginx']['enable'] = true
default['graylog']['nginx']['user'] = "root"
default['graylog']['nginx']['log_directory'] = "/var/log/graylog/nginx"
default['graylog']['nginx']['ssl_country_name'] = "DE"
default['graylog']['nginx']['ssl_state_name'] = "Hamburg"
default['graylog']['nginx']['ssl_locality_name'] = "Hamburg"
default['graylog']['nginx']['ssl_company_name'] = "Graylog"
default['graylog']['nginx']['ssl_organizational_unit_name'] = "Operations"
default['graylog']['nginx']['server_name'] = node['fqdn'] || node['hostname'] || "graylog"
default['graylog']['nginx']['ssl_email_address'] = "graylog@#{node['graylog']['nginx']['server_name']}"
default['graylog']['nginx']['ssl_protocols'] = "TLSv1 TLSv1.1 TLSv1.2"
default['graylog']['nginx']['ssl_ciphers'] = "ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA"

# Etcd
default['graylog']['etcd']['enable'] = true
default['graylog']['etcd']['log_directory'] = "/var/log/graylog/etcd"
default['graylog']['etcd']['data_directory'] = "/var/opt/graylog/data/etcd"

# Logging
default['graylog']['logging']['svlogd_size'] = 200 * 1024 * 1024 # rotate after 200 MB of log data
default['graylog']['logging']['svlogd_num'] = 30 # keep 30 rotated log files
default['graylog']['logging']['svlogd_timeout'] = 24 * 60 * 60 # rotate after 24 hours
default['graylog']['logging']['svlogd_filter'] = "gzip" # compress logs with gzip
default['graylog']['logging']['svlogd_udp'] = nil # transmit log messages via UDP
default['graylog']['logging']['svlogd_prefix'] = nil # custom prefix for log messages
default['graylog']['logging']['udp_log_shipping_host'] = nil # remote host to ship log messages to via UDP
default['graylog']['logging']['udp_log_shipping_port'] = 514 # remote host to ship log messages to via UDP

default['graylog']['nginx']['svlogd_size'] = 100 * 1024 * 1024 # rotate after 100 MB of log data
default['graylog']['nginx']['svlogd_num'] = 5 # reduced backlog for nginx


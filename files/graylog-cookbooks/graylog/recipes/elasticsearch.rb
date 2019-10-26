es_log_dir  = node['graylog']['elasticsearch']['log_directory']
es_data_dir = node['graylog']['elasticsearch']['data_directory']
es_user     = node['graylog']['user']['username']

directory es_log_dir do
  owner es_user
  mode "0700"
  recursive true
end

directory es_data_dir do
  owner es_user
  group node['graylog']['user']['group']
  mode "0750"
  recursive true
end

directory "#{node['graylog']['install_directory']}/elasticsearch/config" do
  owner es_user
  group node['graylog']['user']['group']
  mode "0750"
  recursive true
end

es_memory = ENV['ES_MEMORY'] || node['graylog']['elasticsearch']['memory'] || "#{(node.memory.total.to_i * 0.5 ).floor / 1024}m"
template "#{node['graylog']['install_directory']}/elasticsearch/config/jvm.options" do
  owner es_user
  group node['graylog']['user']['group']
  mode "0644"
  variables(
    :max_memory => es_memory
  )
  notifies :restart, 'service[elasticsearch]'
end

template "#{node['graylog']['install_directory']}/elasticsearch/config/elasticsearch.yml" do
  owner es_user
  group node['graylog']['user']['group']
  mode "0644"
  variables(
    :es_host  => $registry.get_es_host,
    :es_nodes => $registry.get_es_nodes.map{|x| "#{x}:9300"}.to_s
  )
  notifies :restart, 'service[elasticsearch]'
end

template "#{node['graylog']['install_directory']}/elasticsearch/config/log4j2.properties" do
  source "elasticsearch_log4j2.properties.erb"
  owner es_user
  group node['graylog']['user']['group']
  mode "0644"
  notifies :restart, 'service[elasticsearch]'
end

link "#{node['graylog']['install_directory']}/conf/elasticsearch" do
  to "#{node['graylog']['install_directory']}/elasticsearch/config"
end

runit_service "elasticsearch" do
  restart_command "-w 45 restart"
  run_restart false
  options({
    :log_directory => es_log_dir,
    :install_directory => node['graylog']['install_directory']
  }.merge(params))
  log_options node['graylog']['logging'].to_hash.merge(node['graylog']['elasticsearch'].to_hash)
end

if node['graylog']['bootstrap']['enable']
  execute "/opt/graylog/embedded/bin/graylog-ctl start elasticsearch" do
    retries 20
  end
end

ruby_block "add node to cluster list" do
  block do
    $registry.add_es_node(node['ipaddress'])
  end
end

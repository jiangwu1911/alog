#
# Cookbook Name:: runit
# Recipe:: systemd
#
# Copyright 2014 GitLab B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

link "/etc/systemd/system/default.target.wants/graylog-runsvdir.service" do
  to "/opt/graylog/embedded/cookbooks/runit/files/default/graylog-runsvdir.service"
  notifies :run, 'execute[systemctl daemon-reload]', :immediately
  notifies :run, 'execute[systemctl start graylog-runsvdir]', :immediately
end

execute "systemctl daemon-reload" do
  action :nothing
end

execute "systemctl start graylog-runsvdir" do
  action :nothing
end

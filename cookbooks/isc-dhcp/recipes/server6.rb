#
# Cookbook Name:: isc-dhcp
# Recipe:: server6
#
# Copyright 2012, Alex Kiernan
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

include_recipe "isc-dhcp::server-base"

cookbook_file "/etc/default/isc-dhcp6-server" do
  source "isc-dhcp6-server.default"
  owner "root"
  group "root"
  mode 0644
  not_if "dpkg -S /etc/init.d/isc-dhcp6-server"
end

cookbook_file "/etc/init.d/isc-dhcp6-server" do
  source "isc-dhcp6-server.init"
  owner "root"
  group "root"
  mode 0755
  not_if "dpkg -S /etc/init.d/isc-dhcp6-server"
end

template "/etc/dhcp/dhcpd6.conf" do
  source "dhcpd6.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

file "/var/lib/dhcp/dhcpd6.leases" do
  owner "dhcpd"
  group "dhcpd"
  mode 0644
  action :create_if_missing
end

service "isc-dhcp6-server" do
  action [:enable, :start]
end


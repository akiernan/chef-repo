#
# Cookbook Name:: isc-dhcp
# Recipe:: server
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

template "/etc/dhcp/dhcpd.conf" do
  source "dhcpd.conf.erb"
  owner "root"
  group "dhcpd"
  mode 0640
  notifies :restart, "service[isc-dhcp-server]"
end

service "isc-dhcp-server" do
  action [:enable, :start]
end

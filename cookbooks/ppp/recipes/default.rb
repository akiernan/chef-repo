#
# Cookbook Name:: ppp
# Recipe:: default
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

package "ppp" do
  action :install
end

chap_secrets = Array.new

search("chap-secrets", '*:*') do |c|
  chap_secret = Chef::EncryptedDataBagItem.load("chap-secrets", c["id"])
  chap_secrets << { :client => chap_secret['client'],
                    :server => chap_secret['server'],
                    :secret => chap_secret['secret'] }
end

template "/etc/ppp/chap-secrets" do
  source "chap-secrets.erb"
  owner "root"
  group "root"
  mode 0600
  variables({:chap_secrets => chap_secrets})
end

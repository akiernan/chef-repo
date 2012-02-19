#
# Cookbook Name:: isc-dhcp
# Attribute:: default
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

default["isc-dhcp"]["server6"]["authoritative"] = true
default["isc-dhcp"]["server6"]["domain-search"] = %w{}
default["isc-dhcp"]["server6"]["name-servers"] = %w{}
default["isc-dhcp"]["server6"]["sntp-servers"] = %w{}
default["isc-dhcp"]["server6"]["prefix"] = ""

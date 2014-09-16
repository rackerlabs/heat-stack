# Cookbook Name:: rackspace_cloudbackup
# Recipe:: cloud_agent
#
# Copyright 2014, Rackspace, US, Inc.
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

if platform_family?('rhel')
  yum_repository 'cloud-backup' do
    description 'Rackspace cloud backup agent repo'
    url 'http://agentrepo.drivesrvr.com/redhat/'

    # RCBU packages are unsigned.
    gpgcheck false
  end
elsif platform_family?('debian')
  apt_repository 'cloud-backup' do
    uri 'http://agentrepo.drivesrvr.com/debian/'
    arch 'amd64'
    distribution 'serveragent'
    components ['main']
    key 'http://agentrepo.drivesrvr.com/debian/agentrepo.key'
    action :add
  end
else
  fail "Unknown platform node['platform']"
end

package 'driveclient' do
  action :upgrade
end

#
# Register agent
#
rackspace_cloudbackup_register_agent "Register #{node['hostname']}" do
  rackspace_username node['rackspace']['cloud_credentials']['username']
  rackspace_api_key  node['rackspace']['cloud_credentials']['api_key']
  action :register
  notifies :restart, 'service[driveclient]'

  # For testing
  mock               node['rackspace_cloudbackup']['mock']
end

service 'driveclient' do
  action [:enable, :start]
end

#
# Cookbook Name:: rkhunter
# Recipe:: default
#
# Copyright (C) 2014 Greg Palmier

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#   http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'yum-epel' if platform_family?('rhel')

package 'unhide or unhide.rb' do
  # The Ruby version of unhide is reportedly much better in all
  # respects, including performance. Sometimes it is packaged
  # separately, sometimes not. DISABLE_UNHIDE=2 disables Ruby.
  if node['rkhunter']['config']['disable_unhide'] != 2
    package_name value_for_platform(
      'debian' => {
        '~> 8.0' => 'unhide',
        'default' => 'unhide.rb'
      },
      %w[opensuse opensuseleap suse] => {
        'default' => 'unhide_rb'
      },
      'ubuntu' => {
        'default' => 'unhide.rb'
      },
      'default' => 'unhide'
    )
  else
    package_name 'unhide'
  end

  not_if do
    node['rkhunter']['config']['disable_tests']
      .include?('hidden_procs')
  end
end

package 'rkhunter' do
  action :upgrade
end

template '/etc/default/rkhunter' do
  source 'rkhunter.erb'
  owner 'root'
  group node['root_group']
  mode '0644'
  variables :config => node['rkhunter']['debian']
  only_if { platform_family?('debian') }
end

template '/etc/sysconfig/rkhunter' do
  source 'rkhunter.erb'
  owner 'root'
  group node['root_group']
  mode '0644'
  variables :config => node['rkhunter']['rhel']
  only_if { %w[fedora rhel].include?(node['platform_family']) }
end

template '/etc/rkhunter.conf' do
  source 'rkhunter.conf.erb'
  owner 'root'
  group node['root_group']
  mode '0640'
  variables :config => node['rkhunter']['config']
end

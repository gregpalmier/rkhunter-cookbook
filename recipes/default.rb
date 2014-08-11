#
# Cookbook Name:: rkhunter
# Recipe:: default
#
# Copyright 2013, Greg Palmier
#
# All rights reserved - Redistribute
#
package "rkhunter" do
  action :upgrade
end

template "/etc/default/rkhunter" do
 source "rkhunter.erb"
 owner "root"
 group 0
 mode 00644
end

cookbook_file "/etc/rkhunter.conf" do
 source "rkhunter.conf"
 owner "root"
 group 0
 mode 00644
end

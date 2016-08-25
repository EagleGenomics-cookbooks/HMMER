#
# Cookbook Name:: HMMER
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################
# package install

include_recipe 'apt'
include_recipe 'build-essential'

package ['tar'] do
  action :install
end

package 'zlib-devel' do
  package_name case node['platform_family']
               when 'rhel'
                 'zlib-devel'
               when 'debian'
                 'zlib1g-dev'
               end
end

##########################################################
# here for use by serverspec

magic_shell_environment 'HMMER_VERSION' do
  value node['HMMER']['version']
end

magic_shell_environment 'HMMER_DIR' do
  value node['HMMER']['dir']
end

##########################################################
# main recipe

remote_file "#{Chef::Config[:file_cache_path]}/#{node['HMMER']['filename']}" do
  source node['HMMER']['url']
  action :create_if_missing
end

execute 'un-tar HMMER tar ball' do
  command "tar zxvf #{Chef::Config[:file_cache_path]}/#{node['HMMER']['filename']} -C #{node['HMMER']['install_dir']}"
  not_if { ::File.exist?("#{node['HMMER']['dir']}/README") }
end

# cannot use link with wild cards
execute 'create symbolic links in PATH to executables' do
  command "ln -s -f #{node['HMMER']['dir']}/binaries/* ."
  cwd node['HMMER']['install_dir'] + '/bin'
end

##########################################################
##########################################################

#
# Cookbook Name:: HMMER
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
##########################################################

include_recipe 'build-essential'

##########################################################
# here for use by serverspec

magic_shell_environment 'HMMER_VERSION' do
  value node['HMMER']['version']
end

magic_shell_environment 'HMMER_DIR' do
  value node['HMMER']['dir']
end

##########################################################
# package install

package ['zlib-devel'] do
  action :install
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

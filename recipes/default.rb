#
# Cookbook Name:: crystalline
# Recipe:: default
#
# Copyright (C) 2013 Ian Coffey
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "python"
include_recipe "couchdb"
include_recipe "git"

python_mods = %w{ flask CouchDB configobj Flask-CouchDBKit }

common_tools = %w{ vim curl wget }

group node[:crystalline][:group]

user node[:crystalline][:user] do
  system true
  shell "/bin/bash"
end

python_mods.each do |mod|
  python_pip mod do
    action :install
  end
end

common_tools.each do |tool|
  package tool do
    action :install
  end
end

directory "/opt/crystalline/shared" do
  owner node[:crystalline][:user]
  group node[:crystalline][:group]
  recursive true
end

template "/opt/crystalline/shared/config.ini" do
  source "config.ini.erb"
  mode 755
  owner node[:crystalline][:user]
  group node[:crystalline][:group]
  variables({}.merge(node[:crystalline]))
end

deploy "/opt/crystalline" do
  repo node[:crystalline][:url]
  revision node[:crystalline][:revision]
  user node[:crystalline][:user]
  group node[:crystalline][:group]
  enable_submodules true
  action :deploy
#  restart_command "touch tmp/restart.txt"
  scm_provider Chef::Provider::Git
  create_dirs_before_symlink(%w{logs})
  symlinks({})
  symlink_before_migrate({'config.cfg' => 'config.cfg'})
end 

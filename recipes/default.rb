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

ENV['CRYSTALLINE_SETTINGS'] = node[:app][:config]

group node[:app][:group]

user node[:app][:user] do
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
  owner node[:app][:user]
  group node[:app][:group]
  recursive true
end

deploy "/opt/crystalline" do
  repo node[:app][:url]
  revision node[:app][:revision]
  user node[:app][:user]
  group node[:app][:group]
  enable_submodules true
  action :deploy
  restart_command "touch tmp/restart.txt"
  scm_provider Chef::Provider::Git
  symlink_before_migrate({})
end 



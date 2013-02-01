#
# Cookbook Name:: crystalline
# Recipe:: default
#
# Copyright (C) 2013 Ian Coffey
# 
# All rights reserved - Do Not Redistribute
#

default[:crystalline][:user] = 'crystalline'
default[:crystalline][:group] = 'appgroup'
default[:crystalline][:url] = 'git://github.com/iancoffey/crystalline'
default[:crystalline][:revision] = 'HEAD'
default[:crystalline][:database_server] = 'localhost'
default[:crystalline][:database_name] = 'crystalline'
default[:crystalline][:keepalive] = '100'
default[:crystalline][:api_authkey] = 'changeme'
default[:crystalline][:api_secret] = 'me'




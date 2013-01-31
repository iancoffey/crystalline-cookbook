#
# Cookbook Name:: crystalline
# Recipe:: default
#
# Copyright (C) 2013 Ian Coffey
# 
# All rights reserved - Do Not Redistribute
#

default[:app][:user] = 'crystalline'
default[:app][:group] = 'appgroup'
default[:app][:url] = 'git://github.com/iancoffey/crystalline'
default[:app][:revision] = 'HEAD'
default[:app][:local_config][:file] = ''

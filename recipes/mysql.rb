#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright (C) 2016
#
#
#
# Install mysql server and client
mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password 'a'
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end

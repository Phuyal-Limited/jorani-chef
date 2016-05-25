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

mysql2_chef_gem 'default' do
  action :install
end

# Create a mysql database
mysql_database 'lms_tna' do
  connection(
    :host     => '127.0.0.1',
    :username => 'root',
    :password => 'a'
  )
  action :create
end


# create connection info as an external ruby hash
mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => 'a'
}

# Create a mysql user
# Grant SELECT, UPDATE, and INSERT privileges to all tables in foo db from all hosts
mysql_database_user 'lms_tna' do
  connection    mysql_connection_info
  password      'super_secret'
  database_name 'lms_tna'
  host          '%'
  privileges    [:select,:update,:insert]
  action        :grant
end

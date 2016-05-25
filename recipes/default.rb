#
# Cookbook Name:: jorani
# Recipe:: default
#
# Copyright (C) 2014
#
#
#
include_recipe 'apt'
include_recipe 'php'
include_recipe 'zip'
include_recipe 'git'
include_recipe 'apache2'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_php5'
include_recipe 'php5-mysql'

#Download the archive, unzip it and copy it at /var/www/html/<site>
%w(lms_technoferry lms_tna).each do |site|
 ark site do
    url 'https://github.com/bbalet/jorani/archive/v0.4.6.zip'
    action :put
 end
end

#create vhost named <vhost> by using tempaltes
%w(lms_technoferry lms_tna).each do |vhost|
 apache_conf vhost do
  enable true
 end
end

#
# Cookbook Name:: base_packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# init package system
init_recipe_prefix = "cookbook-base_packages::init_"
case node['platform_family']
    when "rhel", "fedora"
        type = "yum"
    when "debian"
        type = "apt"
    else
        # TODO
        type = "other_package"
end
include_recipe "#{init_recipe_prefix}#{type}"

# minimum packages
node['base_packages'][type]['minimum'].each do |pkg|
    package pkg do
        action :install
    end
end

# additional packages
node['base_packages']['additional'].each do |pkg|
    package pkg do
        action :install
    end
end

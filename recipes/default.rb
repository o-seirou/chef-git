#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "git" do
	action :install
end

script "init_git" do
	interpreter "bash"
	user        "vagrant"
	group       "vagrant"
	environment("HOME" => "/home/vagrant")
	code <<-EOH
	git config --global user.email "#{node[:git][:email]}"
	git config --global user.name "#{node[:git][:name]}"
	EOH
	not_if "grep #{node[:git][:email]} $HOME/.gitconfig > /dev/null"
end

script "config_github" do
	interpreter "bash"
	user "root"
	code <<-EOH
	echo 'Host github.com
    User git
    port 22
    Hostname github.com
    IdentityFile ~/.ssh/id_rsa_github
    TCPKeepAlive yes
    IdentitiesOnly yes' >> /home/vagrant/.ssh/config
	EOH
	not_if "grep 'github.com' /home/vagrant/.ssh/config > /dev/null"
end

cookbook_file "/home/vagrant/.ssh/id_rsa_github" do
	source ".ssh/id_rsa_github"
	mode   0600
	owner "vagrant"
	only_if do ! File.exists?("/home/vagrant/.ssh/id_rsa_github") end
end

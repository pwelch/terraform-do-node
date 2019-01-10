# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# Recipe: default.rb
#

hostname '${hostname}'

%w{
  curl
  git
  tmux
  vim
  wget
}.each do |pkg|
  package pkg do
    action :install
  end
end

remote_file '/tmp/do_agent_install.sh' do
  source 'https://agent.digitalocean.com/install.sh'
  backup false
  owner  'root'
  group  'root'
  mode   '0755'
  action :create_if_missing

  not_if { ::File.exist?('/opt/digitalocean/bin/do-agent') }
end

execute 'install_do_agent' do
  command '/tmp/do_agent_install.sh'

  not_if { ::File.exist?('/opt/digitalocean/bin/do-agent') }
end

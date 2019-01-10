#!/usr/bin/env rake
# encoding: utf-8

def node_ipv4
  %x{terraform output node_ipv4}.chomp!
end

namespace :tf do
  desc 'Terraform fmt'
  task :fmt do
    sh('terraform fmt')
  end

  desc 'Terraform Apply'
  task :apply do
    sh('terraform apply -auto-approve')
  end

  desc 'Terraform Destroy'
  task :destroy do
    sh('terraform destroy --force')
  end
end

namespace :test do
  desc 'Run InSpec Tests'
  task :inspec do
    sh("inspec exec tests/inspec.rb -t ssh://root@#{node_ipv4}")
  end
end

task default: ['tf:fmt']

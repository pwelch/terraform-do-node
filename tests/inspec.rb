# inspec.rb

%w{
  curl
  git
  htop
  tmux
  vim
  wget
}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('do-agent') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

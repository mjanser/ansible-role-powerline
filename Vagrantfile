Vagrant.configure('2') do |config|
  config.vm.box = 'fgrehm/trusty64-lxc'

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '.', '/vagrant/ansible-role-powerline'

  config.vm.provision 'shell' do |s|
    s.keep_color = true
    s.path = 'tests/init.sh'
  end

  config.vm.define 'ubuntu-trusty' do |vmconfig|
    vmconfig.vm.hostname = 'ansible-role-powerline-ubuntu-trusty64'
  end

  config.vm.define 'fedora-23' do |vmconfig|
    vmconfig.vm.hostname = 'ansible-role-powerline-fedora-23'
    vmconfig.vm.box = 'obnox/fedora23-64-lxc'
  end
end

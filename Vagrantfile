Vagrant.configure('2') do |config|
  config.vm.box = 'nhinds/xenial64'

  config.vm.define 'ubuntu-xenial' do |vmconfig|
    vmconfig.vm.box = 'nhinds/xenial64'
    vmconfig.vm.hostname = 'ubuntu-xenial'
  end

  config.vm.define 'ubuntu-trusty' do |vmconfig|
    vmconfig.vm.box = 'fgrehm/trusty64-lxc'
    vmconfig.vm.hostname = 'ubuntu-trusty'
  end

  config.vm.define 'fedora-25' do |vmconfig|
    vmconfig.vm.box = 'mjanser/fedora25-64-lxc'
    vmconfig.vm.hostname = 'fedora-25'
  end

  config.vm.provision 'ansible_local' do |ansible|
    ansible.playbook = 'playbook.yml'
    ansible.sudo = true
  end

  config.vm.provision 'shell' do |s|
    s.keep_color = true
    s.inline = <<SCRIPT
echo "127.0.0.1" > /etc/ansible/hosts
echo "localhost" > /etc/ansible/inventory

cd /vagrant/
ansible-playbook playbook.yml --connection local 2>&1 | tee /tmp/ansible.log

# Remove colors from log file
sed -i -r "s/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" /tmp/ansible.log

# Test for errors
test -n "$(grep -L 'ERROR' /tmp/ansible.log)" \
    && { echo "Errors test: pass"; } \
    || { echo "Errors test: fail" && exit 1; }

# Test for warnings
test -n "$(grep -L 'WARNING' /tmp/ansible.log)" \
    && { echo "Warnings test: pass"; } \
    || { echo "Warnings test: fail" && exit 1; }

# Test for idempotence
grep -q "changed=0.*failed=0" /tmp/ansible.log \
    && { echo "Idempotence test: pass"; } \
    || { echo "Idempotence test: fail" && exit 1; }

ansible-playbook playbook.yml --connection local --check 2>&1 | grep -q "changed=0.*failed=0" \
    && { echo "Check mode: pass"; } \
    || { echo "Check mode: fail" && exit 1; }

SCRIPT
  end
end

Vagrant.configure("2") do |config|
  config.vm.box = "firedot/xenial64"

  config.vm.define "machine1" do |machine1|
    machine1.vm.provision "shell", path: "./scripts/provision.sh"
    machine1.vm.hostname = "machine1"
  end
end

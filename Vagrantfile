require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.host_name = "crystalline-berkshelf"
  config.vm.box = "lucid32"

  #config.vm.network :hostonly, "33.33.33.10"
  config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "appdir", "/tmp/app", "../crystalline"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      },
      :crystalline => {
        :database_server => '192.168.0.169'
      }
    }

    chef.run_list = [
      "recipe[crystalline::default]"
    ]
  end
end

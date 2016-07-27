# vagrant-base-config
Starting point for working with vagrant boxes. Inlcudes nodejs, nginx, php5, git, and CLI for CenturyLink cloud.


Core Dev Software
=======================

Download and install the following applications
------------

**VirtualBox:**
https://www.virtualbox.org/wiki/Downloads

**Vagrant:**
https://www.vagrantup.com/downloads.html

Configuration and operation
------------
**Configuring vagrant:**
Copy the vagrant folder to the root directory of your project, then open the file "Vagrantfile" in that newly copied folder to modify the config.

 1. Change the Host ports in the config.vm.network "forwarded_port" setting if the ports might conflict with something else.

 2. Change the IP address in the config.vm.network "private_network" setting to something that no other vagrant file is using. If this is the first instance you can leave as is.

 3. Edit the setting "config.vm.hostname" to a host name that makes sense for your project. This is an arbitrary host name that you can use instead of an ip address.

 4. Edit the setting "vb.name" to a name unique to this project.

 5. Save changes and exit the file.

 **Launch Terminal app:**
 The following are all terminal shell commands

 **Vagrant plugins:**
 ```shell
 vagrant plugin install vagrant-hostsupdater
 vagrant plugin install vagrant-vbguest
 ```

**How to start vagrant:**

Navigate to your project repo, then navigate to the vagrant folder within that. Then run the command vagrant up...
```shell
cd yourproject/vagrant
vagrant up
```
This may take several minutes as it will download the base image and install everything. This will only take this long the first time.

If you need to activate SSL for the development environment run the following commands from the context of the vagrant folder replace the email and domain placeholders with your specific data...
```shell
vagrant ssh
cd /vagrant
npm install
grunt ssl:YourEmail:YourDomain
```

Once complete you can exit out of your vagrant ssh session by executing the command
```shell
exit
```

Recommended Software
=======================

The following applications are recommended but alternatives may be used
------------

**Atom:**
https://atom.io

Packages:
git-plus,
jshint,
prime-file-icons,
sync-settings

Themes:
Ui: One Dark
syntax: afterglow-monokai-syntax

Additional Info & Links
========================
Vagrant Plugin List:
https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins

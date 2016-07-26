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

**SourceTree:**
https://www.sourcetreeapp.com

**git:**
http://git-scm.com/download/mac

**nodeJS (stable version is preferred):**
https://nodejs.org/en/

Configuration and cleanup using the terminal
------------
**Launch Terminal app:**
Switch default theme and new window theme to “Homebrew” in preferences (so you can be cool)

**Create a global git ignore file:**
```shell
git config --global core.excludesfile ~/.gitignore_global
touch ~/.gitignore_global
nano ~/.gitignore_global
```

Then paste the following:
```
## Begin ignore list ##
# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Vagrant generated files #
######################
.vagrant
## End ignore list ##
```

press "ctl" + "x" to exit, then “y” to save and "enter" to confirm.

**Add user email and name to git config file:**
```shell
nano ~/.gitconfig
```

Fill in name and email. When done "ctrl" + "x" to exit, then “y” to save and "enter" to confirm.

**Enable ssh connections for kiln:**
```shell
ssh-keygen -t rsa
```

At the prompt do not enter anything for file and password, just press "enter"

```shell
cat ~/.ssh/id_rsa.pub
```

Copy the output to the clipboard starting with "ssh-rsa".

Now navigate to kiln, click your profile and add the ssh key.
Read more here: http://help.fogcreek.com/8153/using-kiln-with-ssh

**Fix npm permissions:**
```shell
sudo chown -R `whoami` ~/.npm
sudo chown -R `whoami` /usr/local/lib/node_modules
```

**Vagrant plugins:**
```shell
vagrant plugin install vagrant-ghost
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-fsnotify
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

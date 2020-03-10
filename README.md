# Ubuntu 19.04 Vagrant VM: PHP 7.3
* Git
* Nginx
* PHP V7.3
* MySQL V5.7
* Redis
* Composer
* NodeJS
* Npm
* Gulp
* Memcached
* PHPUnit


# Dependencies

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-winnfsd
```

# Visual Studio Code
- Install Remote Development Extension
- Setup ssh_config

```
Host superdeals
    HostName localhost
    Port 2222
    User vagrant
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
    PasswordAuthentication no
    IdentityFile C:/dev-superdeals/.vagrant/machines/lemp7/virtualbox/private_key
    IdentitiesOnly yes
```

- increase maximum watched files (https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc)
-- ```sudo vim /etc/sysctl.conf```
-- add at EOF, ```fs.inotify.max_user_watches=524288```
-- ```sudo sysctl -p```

# Notes & Common Commands
- Changing base url (if wants to use it with ngrok)
-- `bin/magento setup:store-config:set --base-url="http://localhost:8000"`
-- `bin/magento setup:store-config:set --base-url-secure="https://localhost:8000"`
- Refresh Changes on template
-- ```sudo php bin/magento setup:static-content:deploy -f```
-- ```php bin/magento cache:flush```
- Bringing up vagrant
-- ```vagrant --user=<username> --pass=<password> up```

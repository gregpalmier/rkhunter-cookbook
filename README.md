rkhunter Cookbook
=================

[![Build Status](https://secure.travis-ci.org/gregpalmier/rkhunter-cookbook.png)](http://travis-ci.org/gregpalmier/rkhunter-cookbook)

A Chef cookbook for installing and configuring rkhunter

Requirements
------------

1.  Install [ChefDK](https://downloads.chef.io/chef-dk/)
2.  Install [Vagrant](https://www.vagrantup.com)
3.  Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
4.  Install the vagrant-omnibus plugin with `vagrant plugin install vagrant-omnibus`
5.  Install the vagrant-berkshelf plugin with `vagrant plugin install vagrant-berkshelf`

Platforms
---------

Fedora, RHEL, Debian, Ubuntu.

Attributes
----------

All attributes are nested under the `rkhunter` key.

#### rkhunter::default

Non-nil attributes defined under `['rkhunter']['config']` are used to construct `rkhunter.conf`. The key names are upper-cased so `['rkhunter']['config']['auto_x_detect'] = 1` becomes `AUTO_X_DETECT=1`. For options that can be specified more than once, including `enable_tests` and `disable_tests`, use an array. There are far too many configuration options to list here so check the [sample configuration file](http://rkhunter.cvs.sourceforge.net/viewvc/rkhunter/rkhunter/files/rkhunter.conf) that ships with rkhunter.

Debian's configuration file largely follows the upstream defaults while RHEL's adds many paths for a better out-of-box experience. This cookbook mostly defaults to the RHEL values but some of these are only applied to RHEL and Fedora. See the attributes file for details.

#### rkhunter::debian

Attributes to control the execution of rkhunter on Debian.

Key | Type | Description | Default
--- | ---- | ----------- | -------
`['debian']['cron_daily_run']` | Boolean | whether to run daily | `true`
`['debian']['cron_db_update']` | Boolean | whether to update db weekly | `true`
`['debian']['db_update_email']` | Boolean | enable reports of weekly database updates | `false`
`['debian']['report_email']` | String | email address to report to | `root`
`['debian']['apt_autogen']` | Boolean | enable automatic database updates | `false`
`['debian']['nice']` | Integer | niceness of run-level | `0`
`['debian']['run_check_on_battery']` | Boolean | potentially run while on battery | `false`

#### rkhunter::rhel

Attributes to control the execution of rkhunter on RHEL and Fedora.

Key | Type | Description | Default
--- | ---- | ----------- | -------
`['rhel']['mailto']` | String | email address to report to | `root`
`['rhel']['diag_scan']` | String | perform detailed report scan (yes/no) | `no`

Usage
-----

Include `rkhunter` in your node's `run_list` OR create a simple role:

```ruby
name 'rkhunter'
description 'rkhunter config'

run_list(
  'recipe[rkhunter]',
)

default_attributes(
  :rkhunter => {
    :debian {
      :db_update_email => true,
      :report_email => 'your@email.com'
    }
  }
)
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

License: Apache
Authors: Greg Palmier, [Michael Burns](https://github.com/mburns), [James Le Cuirot](https://github.com/chewi).

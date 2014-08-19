rkhunter Cookbook
=================
A Chef cookbook for installing and configuring rkhunter

Requirements
------------
So far, only tested with a Debian 6 Vagrant Box.

Attributes
----------
#### rkhunter::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['rkhunter']['cron_daily_run']</tt></td>
    <td>Boolean</td>
    <td>whether to run daily</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['rkhunter']['cron_db_update']</tt></td>
    <td>Boolean</td>
    <td>whether to update db weekly</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['rkhunter']['db_update_email']</tt></td>
    <td>Boolean</td>
    <td>enable reports of weekly database updates</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['rkhunter']['report_email']</tt></td>
    <td>string</td>
    <td>email address to report to</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['rkhunter']['apt_autogen']</tt></td>
    <td>Boolean</td>
    <td>enable automatic database updates</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['rkhunter']['nice']</tt></td>
    <td>string</td>
    <td>niceness of run-level</td>
    <td><tt>0</tt></td>
  </tr>
  <tr>
    <td><tt>['rkhunter']['run_check_on_battery']</tt></td>
    <td>string</td>
    <td>potentially run while on battery</td>
    <td><tt>false</tt></td>
  </tr>
</table>

Usage
-----
Just include `rkhunter` in your node's `run_list` OR create a simple role:

```json
name "rkhunter"
description "rkhunter config"
run_list(
    "recipe[rkhunter]",
)

default_attributes(
    :rkhunter => { :db_update_email => "true",
                   :report_email => "your@email.com" }
)
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License: Nothing here.  Do what you wish.
Authors: Greg Palmier

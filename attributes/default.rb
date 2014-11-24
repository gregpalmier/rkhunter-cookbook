#/etc/default/rkhunter values
default['rkhunter']['cron_daily_run']	= true
default['rkhunter']['cron_db_update'] = true
default['rkhunter']['db_update_email'] = true
default['rkhunter']['report_email']	= 'root'
default['rkhunter']['apt_autogen'] = false
default['rkhunter']['nice']	= '0'
default['rkhunter']['run_check_on_battery']	= false

#/etc/rkhunter.conf values
default['rkhunter']['allow_ssh_root_user'] = 'no'
default['rkhunter']['scriptwhitelist'] = []
default['rkhunter']['allowhiddendir'] = []
default['rkhunter']['allowhiddenfile'] = []
default['rkhunter']['port_whitelist'] = []

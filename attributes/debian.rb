# /etc/default/rkhunter values for Debian.
debian = default['rkhunter']['debian']
debian['cron_daily_run'] = true
debian['cron_db_update'] = true
debian['db_update_email'] = false
debian['report_email'] = 'root'
debian['apt_autogen'] = false
debian['nice'] = 0
debian['run_check_on_battery'] = false

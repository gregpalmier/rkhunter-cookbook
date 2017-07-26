# /etc/rkhunter.conf values.
config = default['rkhunter']['config']

config['tmpdir'] = '/var/lib/rkhunter/tmp'
config['dbdir'] = '/var/lib/rkhunter/db'
config['scriptdir'] = '/usr/share/rkhunter/scripts'
config['logfile'] = '/var/log/rkhunter.log'
config['auto_x_detect'] = 1
config['allow_ssh_root_user'] = 'no'
config['allow_ssh_prot_v1'] = 0
config['enable_tests'] = %w[ALL]
config['disable_tests'] = %w[
  suspscan
  deleted_files
  packet_cap_apps
  apps
]
config['scriptwhitelist'] = %w[
  /bin/egrep
  /bin/fgrep
  /bin/which
  /usr/bin/groups
  /usr/bin/ldd
  /usr/sbin/adduser
]
config['allowhiddendir'] = %w[
  /etc/.java
  /dev/.udev
  /dev/.udevdb
  /dev/.udev.tdb
  /dev/.static
  /dev/.initramfs
  /dev/.SRC-unix
  /dev/.mdadm
  /dev/.systemd
  /dev/.mount
  /etc/.git
  /etc/.bzr
]
config['allowhiddenfile'] = %w[
  /usr/share/man/man1/..1.gz
  /lib*/.libcrypto.so.*.hmac
  /lib*/.libssl.so.*.hmac
  /usr/bin/.fipscheck.hmac
  /usr/bin/.ssh.hmac
  /usr/bin/.ssh-keygen.hmac
  /usr/bin/.ssh-keyscan.hmac
  /usr/bin/.ssh-add.hmac
  /usr/bin/.ssh-agent.hmac
  /usr/lib*/.libfipscheck.so.*.hmac
  /usr/lib*/.libgcrypt.so.*.hmac
  /usr/lib*/hmaccalc/sha1hmac.hmac
  /usr/lib*/hmaccalc/sha256hmac.hmac
  /usr/lib*/hmaccalc/sha384hmac.hmac
  /usr/lib*/hmaccalc/sha512hmac.hmac
  /usr/sbin/.sshd.hmac
  /dev/.mdadm.map
  /usr/share/man/man5/.k5login.5.gz
  /usr/share/man/man5/.k5identity.5.gz
  /usr/sbin/.ipsec.hmac
  /etc/.etckeeper
  /etc/.gitignore
  /etc/.bzrignore
  /etc/.updated
]
config['allowdevfile'] = %w[
  /dev/shm/qb-attrd-*
  /dev/shm/qb-cfg-*
  /dev/shm/qb-cib_rw-*
  /dev/shm/qb-cib_shm-*
  /dev/shm/qb-corosync-*
  /dev/shm/qb-cpg-*
  /dev/shm/qb-lrmd-*
  /dev/shm/qb-pengine-*
  /dev/shm/qb-quorum-*
  /dev/shm/qb-stonith-*
  /dev/shm/pulse-shm-*
  /dev/md/md-device-map
  /dev/shm/mono.*
  /dev/shm/libv4l-*
  /dev/shm/spice.*
  /dev/md/autorebuild.pid
  /dev/shm/sem.slapd-*.stats
  /dev/shm/squid-cf*
  /dev/shm/squid-ssl_session_cache.shm
]
config['disable_unhide'] = 1
config['installdir'] = '/usr'

case node['platform_family']
when 'fedora', 'rhel'
  config['tmpdir'] = '/var/lib/rkhunter'
  config['logfile'] = '/var/log/rkhunter/rkhunter.log'
  config['pkgmgr'] = 'RPM'
  config['existwhitelist'] = %w[
    /bin/ad
    /var/log/pki-ca/system
    /var/log/pki/pki-tomcat/ca/system
    /usr/bin/GET
    /usr/bin/whatis
  ]
  config['scriptwhitelist'] = %w[
    /usr/bin/whatis
    /usr/bin/ldd
    /usr/bin/groups
    /usr/bin/GET
    /sbin/ifup
    /sbin/ifdown
  ]
  config['rtkt_file_whitelist'] = %w[
    /bin/ad
    /var/log/pki-ca/system
    /var/log/pki/pki-tomcat/ca/system
  ]
end

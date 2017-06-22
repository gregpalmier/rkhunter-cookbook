# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe package('rkhunter') do
  it { should be_installed   }
end

describe file('/etc/default/rkhunter'), :if => %w[debian ubuntu].include?(os[:family]) do
  it { should be_file }
  it { should be_mode '644' }
  it { should be_owned_by 'root' }
  its(:content) { should match(/^CRON_DAILY_RUN=true/) }
  its(:content) { should match(/^CRON_DB_UPDATE=true/) }
  its(:content) { should match(/^DB_UPDATE_EMAIL=true/) }
  its(:content) { should match(/^REPORT_EMAIL=you@example.com/) }
end

describe file('/etc/sysconfig/rkhunter'), :if => os[:family] == 'redhat' do
  it { should be_file }
  it { should be_mode '644' }
  it { should be_owned_by 'root' }
  its(:content) { should match(/^MAILTO=you@example.com/) }
  its(:content) { should match(/^DIAG_SCAN=no/) }
end

describe file('/etc/rkhunter.conf') do
  it { should be_file }
  it { should be_mode '640' }
  it { should be_owned_by 'root' }
end

require_relative 'spec_helper'

describe 'rkhunter::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs rkhunter' do
    expect(chef_run).to upgrade_package('rkhunter')
  end

  it 'write defaults file' do
    expect(chef_run).to create_template('/etc/default/rkhunter').with(
      :user => 'root',
      :group => 0,
      :mode => 00644
    )
  end

  it 'write rkhunter config file' do
    expect(chef_run).to create_template('/etc/rkhunter.conf').with(
      :user => 'root',
      :group => 0,
      :mode => 00644
    )
  end
end

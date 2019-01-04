require_relative 'spec_helper'

describe 'rkhunter::default' do
  platforms = {
    'centos' => '7.3.1611',
    'debian' => '8.7',
    'ubuntu' => '16.04'
  }

  platforms.each do |platform, version|
    context "on #{platform} #{version}" do
      let(:chef_run) do
        runner = ChefSpec::SoloRunner.new(:platform => platform, :version => version)
        runner.converge(described_recipe)
      end

      pkg =
        case platform
        when 'ubuntu'
          'unhide.rb'
        else
          'unhide'
        end

      it "installs #{pkg}" do
        expect(chef_run).to install_package(pkg)
      end

      it 'upgrades rkhunter' do
        expect(chef_run).to upgrade_package('rkhunter')
      end

      dir =
        case platform
        when 'centos'
          'sysconfig'
        when 'debian', 'ubuntu'
          'default'
        end

      if dir
        it "writes #{dir} file" do
          expect(chef_run).to create_template("/etc/#{dir}/rkhunter").with(
            :user => 'root',
            :group => 'root',
            :mode => '0644'
          )
        end
      end

      it 'writes rkhunter config file' do
        expect(chef_run).to create_template('/etc/rkhunter.conf').with(
          :user => 'root',
          :group => 'root',
          :mode => '0640'
        )
      end
    end
  end
end

require 'spec_helper'

describe 'bitlbee' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'testuser',
    }
  end
  it { should include_class('bitlbee::config') }
  it { should contain_package('bitlbee').with_provider('homebrew') }
  it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with( 'group' => 'wheel', 'owner' => 'root') }
  it { should contain_file("#{facts[:boxen_home]}/config/bitlbee").with('ensure' => 'directory') }
  it { should contain_file("#{facts[:boxen_home]}/log/bitlbee").with('ensure' => 'directory') }
  it { should contain_service('bitlbee').with(:ensure => 'running') }
end
require 'spec_helper'

RSpec.describe Shenzhen::Distribute::HockeyApp do
  it 'should be able to initialize a client' do
    info_plist = fixture_file_path('Info.plist')
    expect(Shenzhen::Distribute::HockeyApp::Client.new('FAKE_HOCKEYAPP_API_TOKEN')).to_not be_nil
  end
end

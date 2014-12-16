require 'spec_helper'

describe Shenzhen::PlistBuddy do
  it 'should be able to set value for key in a plist' do
    info_plist = fixture_file_path('Info.plist')
    expect(Shenzhen::PlistBuddy.set(info_plist, 'CFBundleIdentifier', 'com.lxcid.xcode_manager')).to be_truthy
  end
end

require 'spec_helper'

RSpec.describe Shenzhen::XcodeBuild do
  it 'should be able to set value for key in a plist' do
    sdk = 'iphoneos'
    configuration = 'AdHoc'
    project = fixture_file_path('App/App.xcodeproj')
  
    flags = []
    flags << %(-sdk "#{sdk}")
    flags << %(-project "#{project}")
    flags << %(-configuration "#{configuration}")
    
    expect(Shenzhen::XcodeBuild.settings_for_action('build', flags).members).to_not be_empty
    expect(Shenzhen::XcodeBuild.settings_for_action('archive', flags).members).to_not be_empty
    expect(Shenzhen::XcodeBuild.settings_for_action('invalid_action', flags).members).to be_empty
  end
end

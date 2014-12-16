require 'spec_helper'

describe XcodeManager do
  it 'should return a version' do
    expect(XcodeManager::VERSION).to_not be_nil
  end
end

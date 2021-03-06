require 'spec_helper'

RSpec.describe VersionKit::Version::Helper do
  context 'next_pre_release' do
    it 'returns nil if no pre-release information is present' do
      expect(VersionKit::Version::Helper.next_pre_release('1.2.3')).to be_nil
    end
    
    it 'handles no numeric pre-release components' do
      expect(VersionKit::Version::Helper.next_pre_release('1.2.3-rc1')).to eq('1.2.3-rc1.1')
    end

    it 'handles a single numeric pre-release component' do
      expect(VersionKit::Version::Helper.next_pre_release('1.2.3-1')).to eq('1.2.3-2')
    end

    it 'handles multiple pre-release components' do
      expect(VersionKit::Version::Helper.next_pre_release('1.2.3-beta.1')).to eq('1.2.3-beta.2')
      expect(VersionKit::Version::Helper.next_pre_release('1.2.3-beta.1.2')).to eq('1.2.3-beta.1.3')
      expect(VersionKit::Version::Helper.next_pre_release('1.2.3-1.2')).to eq('1.2.3-1.3')
      expect(VersionKit::Version::Helper.next_pre_release('1.2.3-alpha.1.beta.2.rc.3')).to eq('1.2.3-alpha.1.beta.2.rc.4')
    end
  end
  
  context 'next_pre_releases' do
    it 'returns nil if no pre-release information is present' do
      expect(VersionKit::Version::Helper.next_pre_releases('1.2.3')).to be_nil
    end
    
    it 'handles no numeric pre-release components' do
      expect(VersionKit::Version::Helper.next_pre_releases('1.2.3-rc1')).to match_array(['1.2.3-rc1.1'])
    end
    
    it 'handles a single numeric pre-release component' do
      expect(VersionKit::Version::Helper.next_pre_releases('1.2.3-1')).to match_array(['1.2.3-2'])
    end
    
    it 'handles multiple pre-release components' do
      expect(VersionKit::Version::Helper.next_pre_releases('1.2.3-beta.1')).to match_array(['1.2.3-beta.2'])
      expect(VersionKit::Version::Helper.next_pre_releases('1.2.3-beta.1.2')).to match_array(['1.2.3-beta.1.3', '1.2.3-beta.2'])
      expect(VersionKit::Version::Helper.next_pre_releases('1.2.3-1.2')).to match_array(['1.2.3-1.3', '1.2.3-2'])
      expect(VersionKit::Version::Helper.next_pre_releases('1.2.3-alpha.1.beta.2.rc.3')).to match_array(['1.2.3-alpha.1.beta.2.rc.4', '1.2.3-alpha.1.beta.3', '1.2.3-alpha.2'])
    end
  end
  
  context 'next_versions' do
    it 'returns the list of next available versions' do
      expect(VersionKit::Version::Helper.next_versions('1.2.3')).to match_array(['2.0.0', '1.3.0', '1.2.4'])
      expect(VersionKit::Version::Helper.next_versions('1.2.3-alpha.4.5')).to match_array(['2.0.0', '1.3.0', '1.2.4', '1.2.3-alpha.5', '1.2.3-alpha.4.6'])
    end
  end
end

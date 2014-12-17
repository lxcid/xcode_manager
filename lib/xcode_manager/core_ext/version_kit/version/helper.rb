VersionKit::Version::Helper.module_eval do
  def self.next_pre_release(version)
    version = coherce_version(version)
    return nil unless (version.pre_release_component && !version.pre_release_component.empty?)
    pre_release_component = version.pre_release_component.dup
    last_component = pre_release_component[-1]
    if last_component.is_a?(Fixnum)
      pre_release_component[-1] = last_component.succ
    else
      pre_release_component << 1
    end
    VersionKit::Version.new([version.number_component, pre_release_component])
  end
end

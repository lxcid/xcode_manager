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
  
  def self.next_pre_releases(version)
    version = coherce_version(version)
    return nil unless (version.pre_release_component && !version.pre_release_component.empty?)
    pre_release_component = version.pre_release_component.dup
    next_pre_releases = []
    until pre_release_component.empty? do
      next_pre_release = next_pre_release(VersionKit::Version.new([version.number_component, pre_release_component]))
      next_pre_releases << next_pre_release if (next_pre_releases.empty? || next_pre_releases.last < next_pre_release)
      pre_release_component.pop
    end
    next_pre_releases
  end
  
  def self.next_versions(version)
    version = coherce_version(version)
    [
      next_major(version),
      next_minor(version),
      next_patch(version),
      next_pre_releases(version)
    ].flatten.compact
  end
end

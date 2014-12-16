module Shenzhen::PlistBuddy
  class << self
    def set(file, key, value)
      _output = `/usr/libexec/PlistBuddy -c "Set :#{key} "#{value}"" "#{file}" 2> /dev/null`
      $?.to_i == 0
    end
  end
end

Shenzhen::XcodeBuild.module_eval do
  def self.settings_for_action(action, *args)
    options = args.last.is_a?(Hash) ? args.pop : {}
    output = `xcodebuild #{(args + args_from_options(options)).join(" ")} -showBuildSettings #{action} 2> /dev/null`

    return nil unless /\S/ === output

    raise Error.new $1 if /^xcodebuild\: error\: (.+)$/ === output

    lines = output.split(/\n/)

    settings, target = {}, nil
    lines.each do |line|
      case line
      when /Build settings for action #{action} and target \"?([^":]+)/
        target = $1
        settings[target] = {}
      else
        key, value = line.split(/\=/).collect(&:strip)
        settings[target][key] = value if target
      end
    end

    Shenzhen::XcodeBuild::Settings.new(settings)
  end
end

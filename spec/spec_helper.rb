require 'bundler/setup'
require 'xcode_manager'

def fixture_file_path(path)
  return File.join(File.dirname(__FILE__), 'fixtures', 'files', path)
end

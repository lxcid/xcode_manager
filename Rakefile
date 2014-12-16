# Bootstrap
#-----------------------------------------------------------------------------#

desc 'Initializes your working copy'
task :bootstrap do
  puts 'Updating submodules…'
  `git submodule update --init --recursive`

  if system('which bundle')
    puts 'Installing gems'
    `bundle install`
  else
    $stderr.puts "\033[0;31m" \
      "[!] Please install the bundler gem manually:\n" \
      '    $ [sudo] gem install bundler' \
      "\e[0m"
    exit 1
  end
end

begin

  require 'bundler/gem_tasks'

  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new

  task :default => :spec
  task :test => :spec

rescue LoadError
  $stderr.puts "\033[0;31m" \
    '[!] Some Rake tasks haven been disabled because the environment' \
    ' couldn’t be loaded. Be sure to run `rake bootstrap` first.' \
    "\e[0m"
end

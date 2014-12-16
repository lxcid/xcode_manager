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

def __main__(argv)

  opt = Getopts.getopts(
    'vh',
    'version',
    'help',
    'path:'
  )

  if opt['v'] || opt['version']
    puts "v#{Watcher::VERSION}"
  elsif opt['h'] || opt['help'] || opt['path'] == ''
    puts "#{Watcher::HELP}"
  elsif opt['path']
    w = Watcher::Watcher.new(opt)
    w.watch
  else
    puts "#{Watcher::HELP}"
  end

end

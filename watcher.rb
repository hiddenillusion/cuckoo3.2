require 'rubygems'
require 'rb-inotify'
require 'find'

notifier = INotify::Notifier.new
notifier.watch("/path/to/directory/to/watch", :recursive, :create, :moved_to) do |event|
        puts "New file found: #{event.absolute_name}"
        IO.popen("/path/to/interim/script #{event.absolute_name}")
end
notifier.run


module Watcher
  class Watcher

    def initialize(opts = {})
      @path = opts['path']
      @event = opts['event']
    end

    def watch
      logging('DEBUG', 'Watch starting...')
      watcher = Inotify::RecursiveNotifier.new
      watcher.rwatch(@path, :all_events) do |event|
        # puts event.inspect
        #
        # - [close_write, :close]
        # - 書き込みが発生したファイルを検知する
        #
        if event.events[0] == :close_write && event.events[1] == :close
          if event.watched_path[-1] == '/'
            logging('INFO', event.watched_path + event.name)
          else
            logging('INFO', event.watched_path + '/' + event.name)
          end
        end
      end

      watcher.process while true
    end

    private

    def action
      #
      # 対象のファイルをなんかしたい
      #
    end

    def logging(level, path)
      #
      # ログっぽい出力を得るように強引に puts で
      #
      logdate = Time.now
      if level == 'DEBUG'
        puts '[' + logdate.to_s + '] ' + level +  ' : ' + path
      elsif level == 'INFO'
        puts '[' + logdate.to_s + '] ' + level +  '  : ' + path + ' created.'
      end
    end

  end
end

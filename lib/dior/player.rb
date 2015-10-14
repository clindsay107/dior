require 'open3'

module Dior
  class Player

    def initialize
      @current_track
      @paused = false
      @queue = []
    end

    def play(data)
      if @paused
        # execute_command("pkill -CONT mpg123")
        `pkill -CONT mpg123 &`
      else
        path = File.expand_path(data.split[1])
        # execute_command("mpg123 #{path}")
        # `mpg123 #{path} -q &`
        system("mpg123 #{path} >/dev/null 2>&1 &")
        @paused = true
      end
    end

    def pause
      @paused = true
      # execute_command("pkill -STOP mpg123")
      `pkill -STOP mpg123 &`
    end

    # def execute_command(command)
    #   i, o, t = Open3.popen2("#{command} &")
    #   Thread.new {
    #     while c = gets
    #       i.puts
    #     end
    #     i.close
    #   }
    #   puts c while c = o.gets
    # end

  end
end

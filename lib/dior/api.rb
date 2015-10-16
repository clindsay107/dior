require 'open3'

module Dior
  # A module to interface with mpg123 through stdin/stdout via the control interface
  # See http://www.mpg123.de/mpg123/mpg123/README.remote for reference
  module API

    def open_connection
      # Open mpg123 with generic remote interface
      start_cmd = 'mpg123 -R'

      @stdin, stdoe, wait_thr = Open3.popen2e(start_cmd)

      @thread = Thread.new {
        while @line = stdoe.gets
        end
      }
    end

    def close_connection
      @thread.join
    end

    def load(path)
      path = File.expand_path(path)
      send("L #{path}")
    end

    def quit
      send("Q")
    end

    def pause
      send("P")
    end

    def stop
      send("S")
    end

    private

    def send(command)
      @stdin.puts(command)
    end

  end
end

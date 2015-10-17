require 'open3'
require 'thread'

module Dior
  # A module to interface with mpg123 through stdin/stdout via the control interface
  # See http://www.mpg123.de/mpg123/mpg123/README.remote for reference
  module API

    attr_reader :seconds, :seconds_left, :current_frame

    def open_connection
      # Open mpg123 with generic remote interface
      start_cmd = 'mpg123 -R'

      @stdin, stdoe, wait_thr = Open3.popen2e(start_cmd)
      @semaphore = Mutex.new

      Thread.new {
        while line = stdoe.gets
          if line.include?("@F")
            update_seconds_data(line)
          elsif line.include?("@")
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

    def jump(frame)
      send("J #{frame}")
    end

    private

    def send(command)
      @stdin.puts(command)
    end

    def update_seconds_data(line)
      @semaphore.synchronize {
        if line =~ /^@F (\d+) (\d+) ([\d\.]+) ([\d\.]+)$/
          @current_frame, @seconds, @seconds_left = $1, $3, $4
        end
      }
    end

  end
end

require 'audite'

module Dior
  class Player

    attr_reader :engine, :current_track, :queue

    def initialize(path = '.')
      @engine = Audite.new
      @current_track
      @queue = []
      add_to_queue(path)
    end

    def do_play(path)
      @engine.load(path)
      @engine.start_stream
      @engine.thread.join
    end

    def paused?
      if @engine.active.nil? || !@engine.active
        true
      end
      false
    end

    def play
      @engine.start_stream if paused?
    end

    def pause
      @engine.stop_stream if !paused?
    end

    # Grab the next file in queue and load it
    def load
      if @queue.empty?
        @enginestop_stream
      else
        @engine.load(@queue.shift)
      end
    end

    private

    # Add .mp3 file or dir of .mp3s to the queue array
    def add_to_queue(path)
      path = File.expand_path(path)

      if File.directory?(path)
        @queue += Dir[path + "/**/*.mp3"]
      else
        @queue << path
      end
    end

  end
end

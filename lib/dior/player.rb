require 'audite'

module Dior
  class Player
    include API

    attr_reader :engine, :current_track, :queue

    def initialize(path = '.')
      open_connection
      @current_track
      @queue = []
      add_to_queue(path)
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

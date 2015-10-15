module Dior
  class Player
    include Middleware

    def initialize
      @current_track
      @paused = false
      @queue = []
    end

    def play(data)
      #
    end

  end
end

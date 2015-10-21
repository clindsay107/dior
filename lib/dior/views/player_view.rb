require 'curses'
require 'dior'

module Dior
  # The main player window
  class PlayerView

    attr_reader :window

    def initialize(player)
      @window = Curses::Window.new(Curses.lines - 6, Curses.cols, 5, 0)
      @x = @window.maxx / 2
      @y = @window.maxy / 2
      @player = player
    end

    def show_main
      cnr
      @window.setpos(@x, @y)
      @player.queue.each_with_index do |track, i|
        @window.setpos(i, @y)
        @window.addstr(track)
      end
      @window.refresh
    end

    def show_help

    end

    private

    def cnr
      @window.clear
      @window.refresh
    end

  end
end

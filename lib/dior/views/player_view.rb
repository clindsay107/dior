require 'curses'
require 'dior/models/player'

module Dior
  # The main player window
  class PlayerView

    attr_reader :window, :player

    def initialize(player)
      @window = Curses::Window.new(Curses.lines - 6, Curses.cols, 5, 0)
      @x = @window.maxx / 2
      @y = @window.maxy / 2
      @player = player
    end

    def show_main
      cnr
      @window.setpos(@x, @y)
      draw_menu
      @window.refresh
    end

    def draw_menu(active_index = 0)
      @player.playlist.each_with_index do |track, i|
        @window.setpos(i, @y)
        if i == active_index
          @window.addstr("> #{track}")
        else
          @window.addstr(track)
        end
      end
    end

    private

    def cnr
      @window.clear
      @window.refresh
    end

  end
end

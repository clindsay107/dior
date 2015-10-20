require 'curses'
require 'dior'

module Dior
  # The main player window
  class PlayerView

    attr_reader :window

    def initialize
      @window = Curses::Window.new(Curses.lines - 6, Curses.cols, 5, 0)
      @x = @window.maxx / 2
      @y = @window.maxy / 2
      @window.box("|", "-")
    end

    def show_main
      @window.setpos(@x, @y)
      @window.addstr("This is the main window!")
      @window.refresh
    end

    def show_splash
      @window.setpos(@x, @y)
      @window.addstr(Dior::TAG)
      @window.refresh
    end
  end
end

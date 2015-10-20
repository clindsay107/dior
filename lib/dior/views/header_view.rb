require 'curses'

module Dior
  # The persistent, topmost bar that displays current track information
  class HeaderView

    def initialize
      @header = Curses::Window.new(5, Curses.cols, 0, 0)
      @header.box("|", "_")
    end

    def show
      @header.addstr("This is the header")#.center(Curses.cols)
      @header.refresh
    end

    def close
      @header.clear
      @header.refresh
      @header.close
    end

  end
end

module Dior
  # The bottom-most view that allows for user input
  class InputView

    attr_reader :window

    def initialize
      @window = Curses::Window.new(1, Curses.cols, Curses.lines - 1, 0)
    end

    def show
      @window.addstr(">> Type commands here")
      @window.refresh
    end
  end
end

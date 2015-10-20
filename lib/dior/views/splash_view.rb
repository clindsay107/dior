require 'curses'

module Dior
  module SplashView

    def self.show
      win1 = Curses::Window.new(Curses.lines, Curses.cols, 0, 0)
      win1.setpos(win1.maxx, win1.maxy)
      win1.addstr(Dior::TAG)
      win1.refresh
      # sleep(1.5)
      win1.getch
    end

  end
end

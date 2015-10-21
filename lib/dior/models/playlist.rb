module Dior
  class Playlist

    def initialize
      @playlist = []
    end

    def add(track)
      @playlist << track
    end

    def add_from_path(path)
      path = File.expand_path(path)

      if File.directory?(path)
        @playlist += Dir[path + "/**/*.mp3"]
      else
        @playlist << path
      end
    end

  end
end

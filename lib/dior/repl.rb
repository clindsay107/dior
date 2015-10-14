require 'dior/player'

module Dior
  class Repl

    # The last received user command sent to @input
    attr_reader :data

    def initialize(input = $stdin, output = $stdout, options = {})
      @input  = input
      @output = output
      @player = Dior::Player.new
      @data
      # @triggers = Dior::Player::COMMANDS
    end

    # Start the REPL, showing startup message and looping for user input
    def start
      write(Dior::TAG)
      write(startup_message)

      loop do
        write("-> ")
        @data = @input.gets.chomp
        @data == 'exit' ? break : handle_input
      end
    end

    # Delegate input to appropriate handlers, if necessary
    def handle_input
      write(help_msg) if @data == 'help'

      if @data.split[0] == 'play'
        @player.play(@data)
      elsif @data.split[0] == 'pause'
        @player.pause
      end

      # @triggers.each do |k,v|
      #   write("Data is #{@data.split[0]}")
      #   v.call(@data) if @data.split[0] == k
      # end
    end

    private

    def write(message, cr = false)
      cr ? @output.write("\r#{message}") : @output.write(message)
      @output.flush
    end

    def startup_message
      "A command line music thing. Type help for help. Type exit to exit.\n"
    end

    def help_msg
      msg = <<-msg
      This will provide help
      msg
    end

  end
end

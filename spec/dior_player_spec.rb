require 'spec_helper'
require 'dior/player'

describe Dior::Player do

  it "should initialize with a player, unpaused, and no current track" do
    player = Dior::Player.new()
    assert(player.current_track.nil?)
    assert(player.paused? == false)
  end

  it "should be able to initialize with a directory and load tracks into queue" do
    player = Dior::Player.new('spec/resources')
    assert(player.queue.length == 1)
  end

  describe "loading songs from queue" do
    before do
      @player = Dior::Player.new('spec/resources')
    end

    it "should be able to load a track into the player from the queue" do
      @player.load
      assert(@player.queue.empty?)
    end

    it "should stop the stream if load is called with no songs in queue" do
      @player.load
      assert(@player.queue.empty?)
      refute(@player.engine.active)
    end
  end

  describe "playing a track" do
    before do
      @player = Dior::Player.new('spec/resources/test.mp3')
    end

    it "should report as not paused while playing" do
      @player.play
      refute(@player.paused?)
    end
  end

end

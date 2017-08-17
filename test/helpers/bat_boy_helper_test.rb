require 'test_helper'
require_relative 'bat_boy_helper_test_api_returns/home_game_over'
require_relative 'bat_boy_helper_test_api_returns/three_lineup_changes'

class BatBoyHelperTest < ActionView::TestCase
  ANGELS_STADIUM = "60732da9-ad03-4feb-9a36-aee3e98c7a2b"
  ANGELS_TEAM = "4f735188-37c8-473d-ae32-1f7e34ccf892"
  TROUT_ID = "7f518632-2d5d-48c8-b994-2d4d43a1ef3b"
  def setup
    BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
    @batboy_for_home_game_over = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
  end
  test "should stub call to API properly" do
    BatBoy.any_instance.stubs(:get_game_info).returns({very: "sexy"})
    assert_equal ({very: "sexy"}), BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c").inspect
  end
  test "should use stubbed version of game JSON" do
    assert_equal home_game_over, @batboy_for_home_game_over.inspect
  end

  class BatBoy_GameGoingOnTest < ActionView::TestCase
    def setup
      BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
      @batboy_for_home_game_over = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
    end
    test "returns true if the game is still on" do

    end

    test "returns false if the game is over" do
      assert_equal false, @batboy_for_home_game_over.game_going_on?
    end
  end

  class BatBoy_AngelsHomeGameTest < ActionView::TestCase
    def setup
      BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
      @batboy_for_home_game_over = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
    end
    test "returns true if venue is Angel's stadium" do
      assert_equal true, @batboy_for_home_game_over.angels_home_game?
    end

    test "returns false if venue is not Angel's stadium" do

    end
  end


  class BatBoy_PlayerAtBatTest < ActionView::TestCase
    def setup
      BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
      @batboy_for_home_game_over = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
    end
    test "should return nil if game is over" do
      assert_nil @batboy_for_home_game_over.player_at_bat
    end

    test "should return player id if a player is at bat" do

    end
  end

  class BatBoy_TroutAtBatTest < ActionView::TestCase
    def setup
      BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
      @batboy_for_home_game_over = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
    end
    test "should return false if game is over" do
      assert_equal false, @batboy_for_home_game_over.trout_at_bat?
    end

    test "should return false if another player is at bat" do

    end

    test "should return true if Trout is at bat" do

    end
  end
  class BatBoy_AllLineUpEventsTest < ActionView::TestCase
    def setup
      BatBoy.any_instance.stubs(:get_game_info).returns(three_lineup_changes)
      @batboy_for_three_lineup_changes = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
    end
    test "lists all Angels lineup events" do
      assert_equal 4, @batboy_for_three_lineup_changes.all_lineup_events.length
    end
  end

  class BatBoy_PlayersLineupNumberTest < ActionView::TestCase
    def setup
      BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
      @batboy_for_home_game_over = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
    end
    test "knows someone's lineup number when there have been no changes since game beginning" do
      assert_equal 2, @batboy_for_home_game_over.players_lineup_number(TROUT_ID)
    end
    test "knows someone's lineup number after changes" do
      assert_equal 6, @batboy_for_home_game_over.players_lineup_number("68298270-9c8e-4139-a8f8-632151fb7077")
      assert_equal 8, @batboy_for_home_game_over.players_lineup_number("9de4255a-b1d5-455d-bde9-0ae9633e5495")
    end
  end

  class BatBoy_TroutOnDeckTest < ActionView::TestCase
    def setup
      BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
      @batboy_for_home_game_over = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
    end
    test "returns false if game is over" do
      assert_equal false, @batboy_for_home_game_over.trout_on_deck?
    end
    test "returns false if Trout is not on deck" do

    end
    test "returns false if Trout is at bat" do

    end
    test "returns false if Angels are pitching" do

    end
    test "returns true if Trout is on deck" do

    end
  end
end

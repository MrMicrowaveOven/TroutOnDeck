require 'test_helper'
require_relative 'bat_boy_helper_test_api_returns/home_game_over'

class BatBoyHelperTest < ActionView::TestCase
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

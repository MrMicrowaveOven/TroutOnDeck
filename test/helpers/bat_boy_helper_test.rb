require 'test_helper'
require_relative 'bat_boy_helper_test_api_returns/home_game_over'

class BatBoyHelperTest < ActionView::TestCase
  test "should stub call to API properly" do
    BatBoy.any_instance.stubs(:get_game_info).returns({very: "sexy"})

    assert_equal ({very: "sexy"}), BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c").inspect
  end
  test "should use stubbed version of game JSON" do
    BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)

    batboy = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
    assert_equal home_game_over, batboy.inspect
  end

  class BatBoy_GameGoingOnTest < ActionView::TestCase
    test "returns true if the game is still on" do

    end

    test "returns false if the game is over" do
      BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
      batboy = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
      assert_equal false, batboy.game_going_on?
    end
  end

  class BatBoy_PlayerAtBatTest < ActionView::TestCase
    test "should return nil if game is over" do
      BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
      batboy = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
      assert_nil batboy.player_at_bat
    end
  end
end

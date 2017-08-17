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
    assert_equal true, batboy.angels_home_game?
  end

  class BatBoy_GameGoingOnTest < ActionView::TestCase
    test "should know if the game is still going on" do
      BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
      batboy = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")
      assert_equal false, batboy.game_going_on?
    end
  end
end

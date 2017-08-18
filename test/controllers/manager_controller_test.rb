require 'test_helper'

class ManagerControllerTest < ActionDispatch::IntegrationTest
  include ManagerHelper
  test "create ~~ tells us when the game is over" do
    BatBoy.expects(:new).with("yoDude").returns(FakeBatBoy.new("123"))

    post manager_url, params: {
      gameId: "yoDude"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal false, response_body[:gameInProgress]
  end
end

class FakeBatBoy
  def initialize(stuff)
  end
  def game_going_on?
    false
  end
end

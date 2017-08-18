require 'test_helper'

class ManagerControllerTest < ActionDispatch::IntegrationTest
  include ManagerHelper
  test "create ~~ tells us when the game is over" do
    BatBoy.expects(:new).with("yoDude").returns(OverBoy.new("123"))

    post manager_url, params: {
      gameId: "yoDude"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal false, response_body[:gameInProgress]
  end
  test "create ~~ if game isn't over, checks to see if text was sent recently" do
    BatBoy.expects(:new).with("yoDude").returns(StillGoingBoy.new("123"))
    Alert.expects(:text_sent_recently).returns(true)

    post manager_url, params: {
      gameId: "yoDude"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal true, response_body[:gameInProgress]
    assert_equal true, response_body[:textSentRecently]
  end
  test "create ~~ if game isn't over, and text wasn't sent recently, checks to see if Trout is at bat" do
    BatBoy.expects(:new).with("yoDude").returns(StillGoingBoy.new("123"))
    Alert.expects(:text_sent_recently).returns(true)

    post manager_url, params: {
      gameId: "yoDude"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal true, response_body[:gameInProgress]
    assert_equal true, response_body[:textSentRecently]
  end
end

class StillGoingBoy
  def initialize(stuff)
  end
  def game_going_on?
    true
  end
end

class OverBoy
  def initialize(stuff)
  end
  def game_going_on?
    false
  end
end

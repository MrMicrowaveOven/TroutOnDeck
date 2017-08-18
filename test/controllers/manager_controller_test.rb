require 'test_helper'

class ManagerControllerTest < ActionDispatch::IntegrationTest
  include ManagerHelper

  test "create ~~ tells us when the game is over" do
    BatBoy.expects(:new).with("overboy").returns(OverBoy.new("123"))

    post manager_url, params: {
      gameId: "overboy"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal false, response_body[:gameInProgress]
  end
  test "create ~~ if game isn't over, checks to see if text was sent recently" do
    BatBoy.expects(:new).with("stillgoingboy").returns(StillGoingBoy.new("123"))
    Alert.expects(:text_sent_recently?).returns(true)

    post manager_url, params: {
      gameId: "stillgoingboy"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal true, response_body[:gameInProgress]
    assert_equal true, response_body[:textSentRecently]
  end
  test "create ~~ if time is right, checks to see if Trout is at bat" do
    BatBoy.expects(:new).with("disappointedboy").returns(DisappointedBoy.new("123"))
    Alert.expects(:text_sent_recently?).returns(false)
    post manager_url, params: {
      gameId: "disappointedboy"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal true, response_body[:gameInProgress]
    assert_equal false, response_body[:textSentRecently]
    assert_equal false, response_body[:troutAtBat]
    assert_equal false, response_body[:troutOnDeck]
  end
  test "create ~~ if Trout is not at bat, checks to see if he is on deck" do
    BatBoy.expects(:new).with("disappointedboy").returns(DisappointedBoy.new("123"))
    Alert.expects(:text_sent_recently?).returns(false)
    post manager_url, params: {
      gameId: "disappointedboy"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal true, response_body[:gameInProgress]
    assert_equal false, response_body[:textSentRecently]
    assert_equal false, response_body[:troutAtBat]
    assert_equal false, response_body[:troutOnDeck]
  end
  test "create ~~ if Trout is at bat, calls Commentator to send texts" do
    BatBoy.expects(:new).with("thrilledboy").returns(ThrilledBoy.new("123"))
    Alert.expects(:text_sent_recently?).returns(false)
    Commentator.expects(:send_texts).returns(false)
    post manager_url, params: {
      gameId: "thrilledboy"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal true, response_body[:gameInProgress]
    assert_equal false, response_body[:textSentRecently]
    assert_equal true, response_body[:troutAtBat]
    assert_equal false, response_body[:troutOnDeck]
  end

  test "create ~~ if Trout is on deck, calls Commentator to sent texts" do
    BatBoy.expects(:new).with("anxiousboy").returns(AnxiousBoy.new("123"))
    Alert.expects(:text_sent_recently?).returns(false)
    Commentator.expects(:send_texts).returns(false)

    post manager_url, params: {
      gameId: "anxiousboy"
    }

    response_body = JSON.parse(@response.body, :symbolize_names => true)
    assert_equal true, response_body[:gameInProgress]
    assert_equal false, response_body[:textSentRecently]
    assert_equal false, response_body[:troutAtBat]
    assert_equal true, response_body[:troutOnDeck]
  end
end

class AnxiousBoy
  def initialize(stuff)
  end
  def game_going_on?
    true
  end
  def trout_at_bat?
    false
  end
  def trout_on_deck?
    true
  end
end

class ThrilledBoy
  def initialize(stuff)
  end
  def game_going_on?
    true
  end
  def trout_at_bat?
    true
  end
  def trout_on_deck?
    false
  end
end

class DisappointedBoy
  def initialize(stuff)
  end
  def game_going_on?
    true
  end
  def trout_at_bat?
    false
  end
  def trout_on_deck?
    false
  end
end

class StillGoingBoy
  def initialize(stuff)
  end
  def game_going_on?
    true
  end
  def trout_at_bat?
    false
  end
  def trout_on_deck?
    false
  end
end

class OverBoy
  def initialize(stuff)
  end
  def game_going_on?
    false
  end
  def trout_at_bat?
    false
  end
  def trout_on_deck?
    false
  end
end

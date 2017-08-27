require 'test_helper'
require 'json'

class BatBoyHelperTest < ActionView::TestCase
  ANGELS_STADIUM = "60732da9-ad03-4feb-9a36-aee3e98c7a2b"
  ANGELS_TEAM = "4f735188-37c8-473d-ae32-1f7e34ccf892"
  TROUT_ID = "7f518632-2d5d-48c8-b994-2d4d43a1ef3b"
  def setup
    BatBoy.send(:public, *BatBoy.private_instance_methods)

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_AngelsJustMadeLastOutHomeTeamDue_FF.json')
    angels_about_to_bat = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(angels_about_to_bat)
    @n01_angels_about_to_bat_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_Field_TroutinHole_FF.json')
    trout_in_hole1 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_in_hole1)
    @n02_trout_in_hole1_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_Field_TroutinHole2_FF.json')
    trout_in_hole2 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_in_hole2)
    @n03_trout_in_hole2_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_Field_TroutinHole3_FF.json')
    trout_in_hole3 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_in_hole3)
    @n04_trout_in_hole3_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_Hitting_TroutAtBat_FT.json')
    trout_at_bat1 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_at_bat1)
    @n05_trout_at_bat1_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_Hitting_TroutAtBatDone_FF.json')
    trout_at_bat_done = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_at_bat_done)
    @n06_trout_at_bat_done_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_Hitting_TroutBatting2_FT.json')
    trout_batting_2 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_batting_2)
    @n07_trout_batting_2_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_Hitting_TroutOnDeck_TF.json')
    trout_on_deck_1 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_1)
    @n08_trout_on_deck_1_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_Hitting_TroutOnDeck2_TF.json')
    trout_on_deck_2 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_2)
    @n09_trout_on_deck_2_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0818_Away_Hitting_TroutOnDeck3_TF.json')
    trout_on_deck_3 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_3)
    @n10_trout_on_deck_3_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0819_Away_Hitting_FirstPitch_TroutOnDeck_FPT_TF.json')
    trout_on_deck_fpt = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_fpt)
    @n11_trout_on_deck_fpt_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0822_Home_Hitting_TroutJustStruckOut_FPNT_FF.json')
    trout_just_struck_out = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_just_struck_out)
    @n12_trout_just_struck_out_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0822_Home_Hitting_TroutOnDeckAtBottomOfInning_TF.json')
    trout_on_deck_bottom_of_inning = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_bottom_of_inning)
    @n13_trout_on_deck_bottom_of_inning_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0824_Home_Hitting_TroutInHole_FF.json')
    trout_in_hole4 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_in_hole4)
    @n14_trout_in_hole4_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0824_Home_Hitting_TroutOnDeck_TF.json')
    trout_on_deck_4 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_4)
    @n15_trout_on_deck_4_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0824_Home_InningHalfJustFinished_TroutOnDeck_TF.json')
    trout_on_deck_5 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_5)
    @n16_trout_on_deck_5_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0827_Home_Field_TroutOnDeck_InningNotOver_TF.json')
    trout_on_deck_inning_not_over = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_inning_not_over)
    @n17_trout_on_deck_inning_not_over_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0827_Home_Hitting_TroutBatting_FPT_FT.json')
    trout_batting_3 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_batting_3)
    @n18_trout_batting_3_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0827_Home_Hitting_TroutOnDeck_FPNT_TF.json')
    trout_on_deck_6 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_6)
    @n19_trout_on_deck_6_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/0827_Home_Hitting_TroutOnDeck_FPT_TF.json')
    trout_on_deck_7 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_7)
    @n20_trout_on_deck_7_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/AwayBatterJoeyHit6thInning_FF.json')
    player_hit = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(player_hit)
    @n21_player_hit_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/home_game_over.json')
    home_game_over = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
    @n22_home_game_over_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/three_lineup_changes.json')
    three_lineup_changes = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(three_lineup_changes)
    @n23_three_lineup_changes_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

  end

  test "should stub call to API properly" do
    BatBoy.any_instance.stubs(:get_game_info).returns({very: "sexy"})
    assert_equal ({very: "sexy"}), BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c").inspect
  end

  test "should use stubbed version of game JSON" do
    file = File.read('test/helpers/bat_boy_helper_test_api_returns/home_game_over.json')
    home_game_over = JSON.parse(file, :symbolize_names => true)
    assert_equal home_game_over, @n22_home_game_over_ff.inspect
  end

  # ====================================================================

  test "game_going_on? ~~ returns true if the game is still on" do
    assert_equal true, @n07_trout_batting_2_ft.game_going_on?
    # assert_equal true, @batboy_for_trout_on_deck_1.game_going_on?
  end

  test "game_going_on? ~~ returns false if the game is over" do
    assert_equal false, @n22_home_game_over_ff.game_going_on?
  end

# ====================================================================

  test "trout_on_deck? ~~ returns false if game is over" do
    assert_equal false, @n22_home_game_over_ff.trout_on_deck?
  end

  test "trout_on_deck? ~~ returns false if Trout is not on deck" do
    # assert_equal false, @batboy_for_trout_at_bat_1.trout_on_deck?
  end

  test "trout_on_deck? ~~ returns false if Trout is at bat" do
    # assert_equal false, @batboy_for_trout_at_bat_1.trout_on_deck?
  end

  test "trout_on_deck? ~~ returns false if Angels are pitching" do
  end

  test "trout_on_deck? ~~ returns true if Trout is on deck" do
    # assert_equal true, @batboy_for_trout_on_deck_1.trout_on_deck?
  end

  # ====================================================================

  test "trout_at_bat? ~~ should return false if game is over" do
    assert_equal false, @n22_home_game_over_ff.trout_at_bat?
  end

  test "trout_at_bat? ~~ should return false if another player is at bat" do
    # assert_equal false, @batboy_for_trout_on_deck_1.trout_at_bat?
  end

  test "trout_at_bat? ~~ should return true if Trout is at bat" do
    # assert_equal true, @batboy_for_trout_at_bat_1.trout_at_bat?
  end

  # ======================Private_Methods=============================

  test "all_lineup_events ~~ lists all Angels lineup events" do
    assert_equal 4, @n23_three_lineup_changes_ff.all_lineup_events.length
  end

# ====================================================================

  test "players_lineup_number ~~ knows someone's lineup number when there have been no changes since game beginning" do
    assert_equal 2, @n22_home_game_over_ff.players_lineup_number(TROUT_ID)
  end

  test "players_lineup_number ~~ knows someone's lineup number after changes" do
    assert_equal 6, @n22_home_game_over_ff.players_lineup_number("68298270-9c8e-4139-a8f8-632151fb7077")
    assert_equal 8, @n22_home_game_over_ff.players_lineup_number("9de4255a-b1d5-455d-bde9-0ae9633e5495")
  end

# ====================================================================

  test "angels_home_game? ~~ returns true if venue is Angel's stadium" do
    assert_equal true, @n22_home_game_over_ff.angels_home_game?
  end

  test "angels_home_game? ~~ returns false if venue is not Angel's stadium" do
    # assert_equal false, @batboy_for_trout_at_bat_1.angels_home_game?
    # assert_equal false, @batboy_for_trout_on_deck_1.angels_home_game?
  end

# ====================================================================

  test "player_at_bat ~~ should return nil if game is over" do
    assert_nil @n22_home_game_over_ff.player_at_bat
  end

  test "player_at_bat ~~ should return player id if a player is at bat" do
    # assert_equal TROUT_ID, @batboy_for_trout_at_bat_1.player_at_bat
  end

end

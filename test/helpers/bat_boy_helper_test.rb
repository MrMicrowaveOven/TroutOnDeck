require 'test_helper'
require 'json'

class BatBoyHelperTest < ActionView::TestCase
  ANGELS_STADIUM = "60732da9-ad03-4feb-9a36-aee3e98c7a2b"
  ANGELS_TEAM = "4f735188-37c8-473d-ae32-1f7e34ccf892"
  TROUT_ID = "7f518632-2d5d-48c8-b994-2d4d43a1ef3b"
  def setup
    BatBoy.send(:public, *BatBoy.private_instance_methods)

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_AngelsJustMadeLastOutHomeTeamDue_FF.json')
    angels_about_to_bat = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(angels_about_to_bat)
    @n01_angels_about_to_bat_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Field_TroutinHole_FF.json')
    trout_in_hole1 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_in_hole1)
    @n02_trout_in_hole1_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Field_TroutinHole2_FF.json')
    trout_in_hole2 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_in_hole2)
    @n03_trout_in_hole2_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Field_TroutinHole3_FF.json')
    trout_in_hole3 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_in_hole3)
    @n04_trout_in_hole3_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Hitting_FirstPitch_TroutOnDeck_FPT_TF.json')
    trout_on_deck_fpt = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_fpt)
    @n05_trout_on_deck_fpt_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Hitting_TroutAtBat_FPNT_FT.json')
    trout_at_bat1 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_at_bat1)
    @n06_trout_at_bat1_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Hitting_TroutAtBatDone_FF.json')
    trout_at_bat_done = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_at_bat_done)
    @n07_trout_at_bat_done_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Hitting_TroutBatting3_FPT_FT.json')
    trout_batting_2 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_batting_2)
    @n08_trout_batting_2_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Hitting_TroutOnDeck_FPT_TF.json')
    trout_on_deck_1 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_1)
    @n09_trout_on_deck_1_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Hitting_TroutOnDeck2_TF.json')
    trout_on_deck_2 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_2)
    @n10_angels_in_field_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Away_Hitting_TroutOnDeck3_TF.json')
    trout_on_deck_3 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_3)
    @n11_trout_on_deck_3_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/AwayBatterJoeyHit6thInning_FF.json')
    player_hit = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(player_hit)
    @n12_player_hit_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Field_TroutOnDeck_InningNotOver_TF.json')
    trout_on_deck_inning_not_over = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_inning_not_over)
    @n13_trout_on_deck_inning_not_over_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/home_game_over.json')
    home_game_over = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(home_game_over)
    @n14_home_game_over_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutBatting_FPNT_FT.json')
    trout_batting_3 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_batting_3)
    @n15_trout_batting_3_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutBatting1_FPT_FT.json')
    trout_batting_4 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_batting_4)
    @n16_trout_batting_4_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutBatting2_FPT_FT.json')
    trout_batting_4 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_batting_4)
    @n17_trout_batting_5_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutInHole_FF.json')
    trout_in_hole4 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_in_hole4)
    @n18_trout_in_hole4_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutJustStruckOut_FPNT_FF.json')
    trout_just_struck_out = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_just_struck_out)
    @n19_trout_just_struck_out_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutLeadsOff_FPNT_FT.json')
    trout_leads_off = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_leads_off)
    @n20_trout_leads_off_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")


    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutOnDeck_FPNT_TF.json')
    trout_on_deck_6 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_6)
    @n21_trout_on_deck_4_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutOnDeck_TF.json')
    trout_on_deck_8 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_8)
    @n22_trout_on_deck_5_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutOnDeck1_FPT_TF.json')
    trout_on_deck_7 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_7)
    @n23_trout_on_deck_6_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutOnDeck2_FPNT_TF.json')
    trout_on_deck_7 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_7)
    @n24_trout_on_deck_7_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutOnDeck3_FPT_TF.json')
    trout_on_deck_7 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_7)
    @n25_trout_on_deck_8_tf = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutOnDeckAtBottomOfInning_TF.json')
    trout_on_deck_bottom_of_inning = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_bottom_of_inning)
    @n26_trout_on_deck_bottom_of_inning_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_Hitting_TroutOut_FPNT_FF.json')
    trout_on_deck_bottom_of_inning = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_bottom_of_inning)
    @n27_trout_out_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/Home_InningHalfJustFinished_TroutOnDeck_TF.json')
    trout_on_deck_5 = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(trout_on_deck_5)
    @n28_trout_at_bat_3_ft = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

    file = File.read('test/helpers/bat_boy_helper_test_api_returns/three_lineup_changes.json')
    three_lineup_changes = JSON.parse(file, :symbolize_names => true)
    BatBoy.any_instance.stubs(:get_game_info).returns(three_lineup_changes)
    @n29_three_lineup_changes_ff = BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c")

  end

  test "should stub call to API properly" do
    BatBoy.any_instance.stubs(:get_game_info).returns({very: "sexy"})
    assert_equal ({very: "sexy"}), BatBoy.new("d7a9a7c5-958b-453b-8789-5bc9469a8e7c").inspect
  end

  test "should use stubbed version of game JSON" do
    file = File.read('test/helpers/bat_boy_helper_test_api_returns/home_game_over.json')
    home_game_over = JSON.parse(file, :symbolize_names => true)
    assert_equal home_game_over, @n14_home_game_over_ff.inspect
  end

  # ====================================================================

  test "game_going_on? ~~ returns true if the game is still on" do
    assert_equal true, @n01_angels_about_to_bat_ff.game_going_on?
    assert_equal true, @n02_trout_in_hole1_ff.game_going_on?
    assert_equal true, @n03_trout_in_hole2_ff.game_going_on?
    assert_equal true, @n04_trout_in_hole3_ff.game_going_on?
    assert_equal true, @n05_trout_on_deck_fpt_tf.game_going_on?
    assert_equal true, @n06_trout_at_bat1_ft.game_going_on?
    assert_equal true, @n07_trout_at_bat_done_ff.game_going_on?
    assert_equal true, @n08_trout_batting_2_ft.game_going_on?
    assert_equal true, @n09_trout_on_deck_1_tf.game_going_on?
    assert_equal true, @n10_angels_in_field_ff.game_going_on?
    assert_equal true, @n11_trout_on_deck_3_tf.game_going_on?
    assert_equal true, @n13_trout_on_deck_inning_not_over_ff.game_going_on?
    assert_equal true, @n15_trout_batting_3_ft.game_going_on?
    assert_equal true, @n16_trout_batting_4_ft.game_going_on?
    assert_equal true, @n17_trout_batting_5_ft.game_going_on?
    assert_equal true, @n18_trout_in_hole4_ff.game_going_on?
    assert_equal true, @n19_trout_just_struck_out_ff.game_going_on?
    assert_equal true, @n20_trout_leads_off_ft.game_going_on?
    assert_equal true, @n21_trout_on_deck_4_tf.game_going_on?
    assert_equal true, @n22_trout_on_deck_5_tf.game_going_on?
    assert_equal true, @n23_trout_on_deck_6_tf.game_going_on?
    assert_equal true, @n24_trout_on_deck_7_tf.game_going_on?
    assert_equal true, @n25_trout_on_deck_8_tf.game_going_on?
    assert_equal true, @n26_trout_on_deck_bottom_of_inning_ff.game_going_on?
    assert_equal true, @n27_trout_out_ff.game_going_on?
    assert_equal true, @n28_trout_at_bat_3_ft.game_going_on?
  end

  test "game_going_on? ~~ returns false if the game is over" do
    assert_equal false, @n12_player_hit_ff.game_going_on?
    assert_equal false, @n14_home_game_over_ff.game_going_on?
    assert_equal false, @n29_three_lineup_changes_ff.game_going_on?
  end

# ====================================================================

  test "trout_on_deck? ~~ returns false if game is over" do
    assert_equal false, @n12_player_hit_ff.trout_on_deck?
    assert_equal false, @n14_home_game_over_ff.trout_on_deck?
    assert_equal false, @n29_three_lineup_changes_ff.trout_on_deck?
  end

  test "trout_on_deck? ~~ returns false if Trout is not on deck" do
    assert_equal false, @n02_trout_in_hole1_ff.trout_on_deck?
    assert_equal false, @n03_trout_in_hole2_ff.trout_on_deck?
    assert_equal false, @n04_trout_in_hole3_ff.trout_on_deck?
    assert_equal false, @n07_trout_at_bat_done_ff.trout_on_deck?
    assert_equal false, @n18_trout_in_hole4_ff.trout_on_deck?
    assert_equal false, @n19_trout_just_struck_out_ff.trout_on_deck?
    assert_equal false, @n27_trout_out_ff.trout_on_deck?
  end

  test "trout_on_deck? ~~ returns false if Trout is at bat" do
    # FPNT
    # assert_equal false, @n06_trout_at_bat1_ft.trout_on_deck?
    assert_equal false, @n08_trout_batting_2_ft.trout_on_deck?
    # FPNT
    # assert_equal false, @n15_trout_batting_3_ft.trout_on_deck?
    assert_equal false, @n16_trout_batting_4_ft.trout_on_deck?
    assert_equal false, @n17_trout_batting_5_ft.trout_on_deck?
    assert_equal false, @n20_trout_leads_off_ft.trout_on_deck?
    assert_equal false, @n28_trout_at_bat_3_ft.trout_on_deck?
  end

  test "trout_on_deck? ~~ returns false if Angels are pitching" do
    # Angels are beginning to pitch, but FPNT
    # assert_equal false, @n01_angels_about_to_bat_ff.trout_on_deck?
    assert_equal false, @n10_angels_in_field_ff.trout_on_deck?
    assert_equal false, @n13_trout_on_deck_inning_not_over_ff.trout_on_deck?
    assert_equal false, @n26_trout_on_deck_bottom_of_inning_ff.trout_on_deck?
  end

  test "trout_on_deck? ~~ returns true if Trout is on deck" do
    assert_equal true, @n05_trout_on_deck_fpt_tf.trout_on_deck?
    assert_equal true, @n09_trout_on_deck_1_tf.trout_on_deck?
    assert_equal true, @n11_trout_on_deck_3_tf.trout_on_deck?
    # FPNT
    # assert_equal true, @n21_trout_on_deck_4_tf.trout_on_deck?
    assert_equal true, @n22_trout_on_deck_5_tf.trout_on_deck?
    assert_equal true, @n23_trout_on_deck_6_tf.trout_on_deck?
    assert_equal true, @n24_trout_on_deck_7_tf.trout_on_deck?
    assert_equal true, @n25_trout_on_deck_8_tf.trout_on_deck?

  end

  # ====================================================================

  test "trout_at_bat? ~~ should return false if game is over" do
    assert_equal false, @n12_player_hit_ff.trout_at_bat?
    assert_equal false, @n14_home_game_over_ff.trout_on_deck?
    assert_equal false, @n29_three_lineup_changes_ff.trout_on_deck?
  end

  test "trout_at_bat? ~~ returns false if Angels are pitching" do
    assert_equal false, @n01_angels_about_to_bat_ff.trout_on_deck?
    assert_equal false, @n26_trout_on_deck_bottom_of_inning_ff.trout_at_bat?
  end

  test "trout_at_bat? ~~ should return false if Trout is on deck" do
    assert_equal false, @n05_trout_on_deck_fpt_tf.trout_at_bat?
    assert_equal false, @n09_trout_on_deck_1_tf.trout_at_bat?
    assert_equal false, @n10_angels_in_field_ff.trout_at_bat?
    assert_equal false, @n11_trout_on_deck_3_tf.trout_at_bat?
    assert_equal false, @n13_trout_on_deck_inning_not_over_ff.trout_at_bat?
    assert_equal false, @n21_trout_on_deck_4_tf.trout_at_bat?
    assert_equal false, @n22_trout_on_deck_5_tf.trout_at_bat?
    assert_equal false, @n23_trout_on_deck_6_tf.trout_at_bat?
    assert_equal false, @n24_trout_on_deck_7_tf.trout_at_bat?
    assert_equal false, @n25_trout_on_deck_8_tf.trout_at_bat?
  end

  test "trout_at_bat? ~~ should return false if another player is at bat" do
    assert_equal false, @n02_trout_in_hole1_ff.trout_at_bat?
    assert_equal false, @n03_trout_in_hole2_ff.trout_at_bat?
    assert_equal false, @n04_trout_in_hole3_ff.trout_at_bat?
    assert_equal false, @n07_trout_at_bat_done_ff.trout_at_bat?
    assert_equal false, @n18_trout_in_hole4_ff.trout_at_bat?
    assert_equal false, @n19_trout_just_struck_out_ff.trout_at_bat?
    # Trout is out, but next pitch hasn't been thrown yet.
    # assert_equal false, @n27_trout_out_ff.trout_at_bat?
  end

  test "trout_at_bat? ~~ should return true if Trout is at bat" do
    # FPNT
    # assert_equal true, @n06_trout_at_bat1_ft.trout_at_bat?
    assert_equal true, @n08_trout_batting_2_ft.trout_at_bat?
    # FPNT
    # assert_equal true, @n15_trout_batting_3_ft.trout_at_bat?
    assert_equal true, @n16_trout_batting_4_ft.trout_at_bat?
    assert_equal true, @n17_trout_batting_5_ft.trout_at_bat?
    assert_equal true, @n28_trout_at_bat_3_ft.trout_at_bat?
    # FPNT
    # assert_equal true, @n20_trout_leads_off_ft.trout_at_bat?
  end

  # ======================Private_Methods=============================

  test "all_lineup_events ~~ lists all Angels lineup events" do
    assert_equal 4, @n29_three_lineup_changes_ff.all_lineup_events.length
  end

# ====================================================================

  test "players_lineup_number ~~ knows someone's lineup number when there have been no changes since game beginning" do

  end

  test "players_lineup_number ~~ knows someone's lineup number after changes" do
  end

# ====================================================================

  test "angels_home_game? ~~ returns true if venue is Angel's stadium" do
    assert_equal true, @n12_player_hit_ff.angels_home_game?
    assert_equal true, @n13_trout_on_deck_inning_not_over_ff.angels_home_game?
    assert_equal true, @n14_home_game_over_ff.angels_home_game?
    assert_equal true, @n15_trout_batting_3_ft.angels_home_game?
    assert_equal true, @n16_trout_batting_4_ft.angels_home_game?
    assert_equal true, @n17_trout_batting_5_ft.angels_home_game?
    assert_equal true, @n18_trout_in_hole4_ff.angels_home_game?
    assert_equal true, @n19_trout_just_struck_out_ff.angels_home_game?
    assert_equal true, @n20_trout_leads_off_ft.angels_home_game?
    assert_equal true, @n21_trout_on_deck_4_tf.angels_home_game?
    assert_equal true, @n22_trout_on_deck_5_tf.angels_home_game?
    assert_equal true, @n23_trout_on_deck_6_tf.angels_home_game?
    assert_equal true, @n24_trout_on_deck_7_tf.angels_home_game?
    assert_equal true, @n25_trout_on_deck_8_tf.angels_home_game?
    assert_equal true, @n26_trout_on_deck_bottom_of_inning_ff.angels_home_game?
    assert_equal true, @n27_trout_out_ff.angels_home_game?
    assert_equal true, @n28_trout_at_bat_3_ft.angels_home_game?
  end

  test "angels_home_game? ~~ returns false if venue is not Angel's stadium" do
    assert_equal false, @n01_angels_about_to_bat_ff.angels_home_game?
    assert_equal false, @n02_trout_in_hole1_ff.angels_home_game?
    assert_equal false, @n03_trout_in_hole2_ff.angels_home_game?
    assert_equal false, @n04_trout_in_hole3_ff.angels_home_game?
    assert_equal false, @n05_trout_on_deck_fpt_tf.angels_home_game?
    assert_equal false, @n06_trout_at_bat1_ft.angels_home_game?
    assert_equal false, @n07_trout_at_bat_done_ff.angels_home_game?
    assert_equal false, @n08_trout_batting_2_ft.angels_home_game?
    assert_equal false, @n09_trout_on_deck_1_tf.angels_home_game?
    assert_equal false, @n10_angels_in_field_ff.angels_home_game?
    assert_equal false, @n11_trout_on_deck_3_tf.angels_home_game?
  end

# ====================================================================

  test "player_at_bat ~~ should return nil if game is over" do
    assert_nil @n12_player_hit_ff.player_at_bat
    assert_nil @n14_home_game_over_ff.player_at_bat
    assert_nil @n29_three_lineup_changes_ff.player_at_bat
  end

  test "player_at_bat ~~ should return player id if a player is at bat" do

  end

end

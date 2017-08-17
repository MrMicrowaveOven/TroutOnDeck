module BatBoyHelper
  require 'open-uri'
  require 'json'

  class BatBoy
    ANGELS_STADIUM = "60732da9-ad03-4feb-9a36-aee3e98c7a2b"
    TROUT_ID = "f502c299-d8a3-44ec-a5c1-b2b0010fb28d"

    def initialize(game_id)
      @game_pbp = get_game_info(game_id)
    end

    def get_game_info(game_id)
      url = "https://api.sportradar.us/mlb-t6/games/" + game_id + "/pbp.json?api_key=" + ENV['SPORTRADAR_KEY']
      response = open(url).read
      JSON.parse(response, :symbolize_names => true)
    end

    def game_going_on?
      @game_pbp[:game][:status] == "inprogress"
    end

    def angels_home_game?
      @game_pbp[:game][:venue][:id] == ANGELS_STADIUM
    end

    def player_at_bat
      return @player_at_bat if @player_at_bat
      return nil if !game_going_on?
      current_inning = @game_pbp[:game][:innings].last
      current_half_inning = current_inning[:halfs].select {|inning_half| inning_half[:events].any?}.last
      at_bat_events = current_half_inning[:events].select { |event| event[:at_bat]}
      return nil if at_bat_events.empty?
      current_at_bat = at_bat_events.last
      @player_at_bat = current_at_bat[:hitter_id]
    end

    # def at_bats_place_in_lineup
    #
    # end

    def trout_at_bat?
      player_at_bat == TROUT_ID
    end

    def trout_on_deck?
      return false if !game_going_on?
      # is_trout_on_deck = false
      # if player_at_bat == "f502c299-d8a3-44ec-a5c1-b2b0010fb28d"
      #   is_trout_at_bat = true
      # end
      # is_trout_at_bat
    end

    def inspect
      @game_pbp
    end
  end
end

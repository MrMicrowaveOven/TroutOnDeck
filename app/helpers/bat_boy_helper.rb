module BatBoyHelper
  require 'open-uri'
  require 'json'

  class BatBoy
    def initialize(game_id)
      @game_pbp = get_game_info(game_id)
    end

    def get_game_info(game_id)
      url = "https://api.sportradar.us/mlb-t6/games/" + game_id + "/pbp.json?api_key=" + ENV['SPORTRADAR_KEY']
      response = open(url).read
      JSON.parse(response)
    end

    def angels_home_game?
      @game_pbp["venue"] == "60732da9-ad03-4feb-9a36-aee3e98c7a2b"
    end

    def method_name

    end

    def player_at_bat
      game_going_on? ? player_at_bat : nil
    end

    def player_at_bat
      return nil if !game_going_on
      current_inning = @game_pbp["game"]["innings"].last
      current_half_inning = current_inning["halfs"].last
      at_bat_events = current_half_inning["events"].select { |event| event["at_bat"]}
      return nil if at_bat_events.empty?
      current_at_bat = at_bat_events.last
      current_at_bat["hitter_id"]
    end

    def game_going_on?
      @game_pbp["game"]["status"] == "inprogress"
    end

    def trout_at_bat?
      @player_at_bat == "f502c299-d8a3-44ec-a5c1-b2b0010fb28d"
    end

    def trout_on_deck?
      is_trout_on_deck = false
      @game_pbp["innings"].last["halfs"].each do |half|
        player_at_bat = half["events"].last["at_bat"]["hitter_id"]
        if player_at_bat == "f502c299-d8a3-44ec-a5c1-b2b0010fb28d"
          is_trout_at_bat = true
        end
      end
      is_trout_at_bat
    end
    def inspect
      @game_pbp
    end
  end
end

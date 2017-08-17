module BatBoyHelper
  require 'open-uri'
  require 'json'

  class BatBoy
    ANGELS_STADIUM = "60732da9-ad03-4feb-9a36-aee3e98c7a2b"
    ANGELS_TEAM = "4f735188-37c8-473d-ae32-1f7e34ccf892"
    TROUT_ID = "7f518632-2d5d-48c8-b994-2d4d43a1ef3b"

    def initialize(game_id)
      @game_pbp = get_game_info(game_id)
    end

    def game_going_on?
      @game_pbp[:game][:status] == "inprogress"
    end

    def trout_at_bat?
      player_at_bat == TROUT_ID
    end

    def trout_on_deck?
      return false if !game_going_on?
      players_lineup_number(player_at_bat) == players_lineup_number(TROUT_ID) + 1
    end

    def get_game_info(game_id)
      url = "https://api.sportradar.us/mlb-t6/games/" + game_id + "/pbp.json?api_key=" + ENV['SPORTRADAR_KEY']
      response = open(url).read
      JSON.parse(response, :symbolize_names => true)
    end

    def all_lineup_events
      return @lineup_events if @lineup_events
      lineup_events = []
      @game_pbp[:game][:innings].each_with_index do |inning, inning_number|
        next if inning.empty?
        inning[:halfs].each do |half|
          half[:events].each do |event|
            if event.keys.first == :lineup
              lineup = event[:lineup]
              event_deets = {
                # inning: inning_number,
                player_id: lineup[:player_id],
                order: lineup[:order],
                # team_id: lineup[:team_id]
              }
              lineup_events << event_deets
            end
          end
        end
      end
      @lineup_events = lineup_events
    end

    def players_lineup_number(player_id)
      players_lineup_events = all_lineup_events.select {|event| event[:player_id] == player_id}
      players_lineup_events.last[:order]
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

    def inspect
      @game_pbp
    end
  end
end

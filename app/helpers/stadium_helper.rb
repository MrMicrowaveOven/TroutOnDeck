module StadiumHelper
  include ManagerHelper

  class Stadium
    def initialize(game_time, game_id)
      p "SLEEP BEGINNING"
      p game_time
      p Time.now
      # Call Dead Man's Snitch that sleep is beginning
      Snitcher.snitch("1a87a8c24a", message: "Sleep is beginning!!!")
      seconds_until_game = DateTime.parse(game_time).to_i - Time.now.to_i
      (seconds_until_game / 60).times do |i|
        Snitcher.snitch("1a87a8c24a", message: "Sleeping: index: #{i}, time: #{Time.now.to_i}, game_time: #{game_time.to_i}")
        # p "Sleeping... index: #{i}, time: #{Time.now}"
        # p "Gametime: #{game_time}"
        # p game_time.to_i
        # p DateTime.parse(game_time).to_i
        # p Time.now.to_i
        # p seconds_until_game
        # p "Gametime in about #{(DateTime.parse(game_time).to_i - Time.now.to_i)/3600} hours"
        sleep(60)
      end
      Snitcher.snitch("1a87a8c24a", message: "Game is beginning!!!")
      p "GAMEON!!!"
      200.times do |index|
        Snitcher.snitch("1a87a8c24a", message: "Checking in-game, #{index}")
        at_bat_info = ManagerHelper.send_text_if_valid(game_id)
        break if !at_bat_info[:gameInProgress] && index > 10
        if at_bat_info[:troutOnDeck] || at_bat_info[:troutAtBat]
          Snitcher.snitch("1a87a8c24a", message: "Text was sent, #{index}")
          p "Text was sent"
          sleep 900
        else
          p "No text sent"
          sleep 120
        end
      end
    end
  end
end
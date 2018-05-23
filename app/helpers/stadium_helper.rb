module StadiumHelper
  include ManagerHelper

  class Stadium
    def initialize(game_time, game_id)
      p "SLEEP BEGINNING"
      p game_time
      p Time.now
      # Call Dead Man's Snitch that sleep is beginning
      Snitcher.snitch("1a87a8c24a", message: "Sleep is beginning!!!")
      sleep(game_time - Time.now)
      Snitcher.snitch("1a87a8c24a", message: "Game is beginning!!!")
      p "GAMEON!!!"
      200.times do |index|
        Snitcher.snitch("1a87a8c24a", message: "Checking in-game, #{index}")
        at_bat_info = ManagerHelper.send_text_if_valid(game_id)
        break if !at_bat_info[:gameInProgress] && index > 10
        if at_bat_info[:troutOnDeck] || at_bat_info[:troutAtBat]
          Snitcher.snitch("1a87a8c24a", message: "Text was sent, #{index}")
          sleep 15
        else
          sleep 2
        end
      end
    end
  end
end

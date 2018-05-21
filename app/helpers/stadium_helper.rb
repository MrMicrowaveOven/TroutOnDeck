module StadiumHelper
  include ManagerHelper

  class Stadium
    def initialize(game_time, game_id)
      sleep(game_time - Time.now)
      200.times do |index|
        at_bat_info = ManagerHelper.send_text_if_valid(game_id)
        break if at_bat_info[:gameInProgress] && index > 10
        if at_bat_info[:troutOnDeck] || at_bat_info[:troutAtBat]
          sleep 15
        else
          sleep 2
        end
      end
    end
  end
end

module StadiumHelper
  include ManagerHelper

  class Stadium
    def initialize(game_time, game_id)
      sleep(game_time - Time.now)
      while true
        at_bat_info = ManagerHelper.send_text_if_valid(game_id)
        break unless at_bat_info[:gameInProgress]
        if at_bat_info[:troutOnDeck] || at_bat_info[:troutAtBat]
          sleep 15
        else
          sleep 2
        end
      end
    end
  end
end

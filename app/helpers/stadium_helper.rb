module StadiumHelper
  include ManagerHelper

  class Stadium
    def initialize
      todays_game = DailySchedule.last
      p "Time now: #{Time.now}"
      p "Game time: #{todays_game.game_time}"
      p "Game started? #{todays_game.game_time > Time.now}"
      return if todays_game.game_time > Time.now
      return if todays_game.game_over
      Snitcher.snitch("1a87a8c24a", message: "Game starting!!! #{Time.now}")
      5.times do |index|
        Snitcher.snitch("1a87a8c24a", message: "Checking in-game, #{index}, #{Time.now}")
        at_bat_info = ManagerHelper.send_text_if_valid(todays_game.game_id)
        if at_bat_info[:troutOnDeck] || at_bat_info[:troutAtBat]
          Snitcher.snitch("1a87a8c24a", message: "Text was sent, #{Time.now}")
        end
        if !at_bat_info[:gameInProgress]
          Snitcher.snitch("1a87a8c24a", message: "Game over at #{Time.now}")
          todays_game.update(game_over: true)
          break
        end
        sleep 120
      end
    end
  end
end

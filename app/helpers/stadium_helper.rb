module StadiumHelper
  include ManagerHelper

  class Stadium
    def initialize
      todays_game = DailySchedule.last
      p "Time now: #{Time.now.utc}"
      p "Game time: #{todays_game.game_time.utc}"
      p "Game Started? #{todays_game.game_time.utc < Time.now.utc}"
      p "Time to game: #{todays_game.game_time.utc - Time.now.utc}"
      return if todays_game.game_time.utc > Time.now.utc
      return if todays_game.game_over
      p "Game started!"
      Snitcher.snitch("1a87a8c24a", message: "Game starting!!! #{Time.now.utc}")
      5.times do |index|
        p "Checking in-game, #{index}, #{Time.now.utc}"
        Snitcher.snitch("1a87a8c24a", message: "Checking in-game, #{index}, #{Time.now.utc}")
        at_bat_info = ManagerHelper.send_text_if_valid(todays_game.game_id)
        if at_bat_info[:troutOnDeck] || at_bat_info[:troutAtBat]
          p "Text was sent, #{Time.now.utc}"
          Snitcher.snitch("1a87a8c24a", message: "Text was sent, #{Time.now.utc}")
        end
        # byebug
        if !at_bat_info[:gameInProgress]
          p  "Game over at #{Time.now.utc}"
          Snitcher.snitch("1a87a8c24a", message: "Game over at #{Time.now.utc}")
          todays_game.update(game_over: true)
          break
        end
        sleep 120
      end
    end
  end
end

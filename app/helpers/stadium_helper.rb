module StadiumHelper
  include ManagerHelper

  class Stadium
    def initialize(game_time, game_id)
      p "SLEEP BEGINNING"
      p game_time
      p Time.now
      # Call Dead Man's Snitch that sleep is beginning
      Snitcher.snitch("1a87a8c24a", message: "Sleep is beginning!!!")
      seconds_until_game = DateTime.parse(game_time) - Time.now
      (seconds_until_game / 1000).times do |i|
        Snitcher.snitch("1a87a8c24a", message: "Sleeping... index: #{i}, time: #{Time.now}")
        p "Sleeping... index: #{i}, time: #{Time.now}"
        sleep(1000)
      end
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

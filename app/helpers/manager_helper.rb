module ManagerHelper
  include BatBoyHelper
  include CommentatorHelper

  def self.send_text_if_valid(game_id)
    batboy = BatBoy.new(game_id)
    gameInProgress = batboy.game_going_on?

    jsonResponse = {
      gameInProgress: gameInProgress,
      textSentRecently: Alert.text_sent_recently?,
      troutAtBat: batboy.trout_at_bat?,
      troutOnDeck: batboy.trout_on_deck?
    }

    if gameInProgress && !jsonResponse[:textSentRecently]
      if jsonResponse[:troutAtBat] || jsonResponse[:troutOnDeck]
        marked_time = Alert.new
        marked_time.save!
        Commentator.send_texts
      end
    end
    jsonResponse
  end
end

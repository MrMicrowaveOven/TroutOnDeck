# TroutOnDeck

This is a fun little page that allows users to notify everyone when Mike Trout is on-deck, since no one wants to miss one of his at-bats.

## UPDATE

The button will not work if there is no game scheduled TODAY, or if the game scheduled TODAY hasn't started yet.

Below is a hypothetical means of using the SportRadar API to automate the app, but it will most likely require more than 1000 calls a month which costs lots of money.

---

## Timing

I'm realizing we can actually make this fairly simple.  I don't know how many "checks" this will add up to, but this should bring us close.

Let's say an at-bat takes 1 minute, making an inning 3 minutes minimum.

IF THE ANGELS ARE BATTING:

Wait 1 minute for every batter before Trout (minus one minute, since we want to catch him on deck).

IF THE OPPONENT IS BATTING:

Wait 1 minute for however many outs are left in the inning, plus 1 minute for every batter before Trout (minus one minute, since we want to catch him on deck).

EXAMPLES

If the Angels are batting and have 5 batters before Trout, we'll want to check in 4 minutes to see if he's on deck.  Then we'll go from there.

If the Opponent is batting with 1 out and there are 3 batters before Trout, we'll assume it will take 2 minutes to get 2 outs, plus 3 minutes to get to Trout batting.  But we want to catch him on deck, so we'll wait 2 minutes for the inning to end, and 2 minutes for him to get on deck.

If Trout is On Deck, we send the text message out to everyone.  Once this happens, since the Angels are still batting, we'll be checking again in 9 minutes.  We want to get more reasonable number for this, since it's very unlikely he'll be batting again in 9 minutes.  But if everyone gets a quick base hit (about a minute each), then it's theoretically possible.

This might be many more checks than we actually need, since we're using the minimum batting time (or close to it anyway), but it's a good starting point.

There will be a few exceptions.  For example, if the bases are loaded and there is 1 out, the inning can end at any point, rather than in 2 minutes minimum.  We can work this out later.

## Play-by-Play checks

1) Check to see if Trout is still playing
2) Get the player before him
3) Check to see if either Trout or player before him is at bat

Everyday at 8:05am PST, make a call to DailySchedule and figure out if there's an Angels Game that day.

-If there's a game, SAVE GameId and Scheduled


| Date | GameId | Scheduled

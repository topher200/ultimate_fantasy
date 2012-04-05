Quirks:

- The FantasyPlayers model records the current roster of each owner, as well
  as the state of their roster for each week. Each player with a week of "0"
  is on the current roster. When the rosters are locked each week, every
  FantasyPlayer with a week "0" is cloned, with a week equal to the current
  week. So when the week 1 rosters are saved, each of the current players (all
  week 0s) will be duplicated, with the new duplicates belonging to week
  1. Once a player has been duplicated in this manner, they should not be
  modified. The "current roster" players (those with week 0) can be traded,
  dropped, or modified at any time.

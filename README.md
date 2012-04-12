Quirks:

- The FantasyPlayers model records the current roster of each owner, as well
  as the state of their roster for each week. Each player with a week of "nil"
  is on the current roster. When the rosters are locked each week, every
  FantasyPlayer with week nil is cloned, replacing "week" with the current
  week. So when the week 1 rosters are saved, each of the current players (all
  week nil-s) will be duplicated, with the new duplicates belonging to week
  1. Once a player has been duplicated in this manner, they should not be
  modified. The "current roster" players (those with week nil) can be traded,
  dropped, or modified at any time.

- The FantasyPlayers model also keeps track of the status of its players. The
  status record must be an integer 0, 1, or 2:
  0: benched
  1: starting
  2: negative
  There should be at most 6 players on a team starting, and 1 player as the
  negative.  This status record is consistant with the "week" record described
  above: if the player has a week of 1 and a status 1, they started week 1. If
  they have a status 1 with a week nil, they are on the current roster and
  starting.

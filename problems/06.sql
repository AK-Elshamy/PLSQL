-- https://leetcode.com/problems/game-play-analysis-i
select a.player_id,
       min(a.event_date) as "first_login"
  from activity a
 group by a.player_id;
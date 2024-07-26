select
  ua.id as "ID",
  ua.username as "Username",
  json_agg(fm.movie_id) as "Favorite movie IDs"
from
  "UserAccount" ua
  join "FavoriteMovie" fm on fm.user_id = ua.id
group by
  ua.id,
  ua.username
order by
  ua.id
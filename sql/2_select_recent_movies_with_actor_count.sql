select
  m.id as "ID",
  m.title as "Title",
  count(c.id) as "Actors count"
from
  "Movie" m
  join "Character" c on m.id = c.movie_id
where
  m.release_date >= current_date - interval '5 YEAR'
group by
  m.id,
  m.title
order by
  m.id
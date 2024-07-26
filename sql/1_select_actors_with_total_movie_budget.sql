select
  p.id as "ID",
  p.first_name as "First name",
  p.last_name as "Last name",
  sum(m.budget) as "Total movies budget"
from
  "Character" c
  join "Person" p on c.actor_id = p.id
  join "Movie" m ON c.movie_id = m.id
group by
  p.id,
  p.last_name,
  p.last_name
order by
  p.id
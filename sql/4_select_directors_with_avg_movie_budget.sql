select
  p.id as "Director ID",
  concat(p.first_name, ' ', p.last_name) as "Director name",
  round(avg(m.budget), 2) as "Average Budget"
from
  "Movie" m
  join "Person" p on m.director_id = p.id
group by
  p.id
order by
  p.id
select
  m.id as "ID",
  m.title as "Title",
  m.release_date as "Release date",
  m.duration as "Duration",
  m.description AS "Description",
  json_build_object(
    'File name',
    f.file_name,
    'Mime type',
    f.mime_type,
    'Url',
    f.url
  ) as "Poster",
  json_build_object(
    'ID',
    p.id,
    'First name',
    p.first_name,
    'Last name',
    p.last_name
  ) AS "Director"
from
  "Movie" m
  left join "File" f on m.poster_id = f.id
  join "Person" p on m.director_id = p.id
  left join "MovieGenres" mg on m.id = mg.movie_id
  left join "Genre" g on mg.genre_id = g.id
where
  m.country_id = 1
  and m.release_date >= '2022-01-01'
  and m.duration > 135
  and (
    g."name" = 'Action'
    or g."name" = 'Drama'
  )
group by
  m.id,
  f.file_name,
  f.mime_type,
  f.url,
  p.id
order by
  m.id
select
  m.id as "ID",
  m.title as "Title",
  m.release_date as "Release Date",
  m.duration as "Duration",
  m.description as "Description",
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
    d.id,
    'First name',
    d.first_name,
    'Last name',
    d.last_name,
    'Photo',
    json_build_object(
      'File name',
      pf.file_name,
      'Mime type',
      pf.mime_type,
      'Url',
      pf.url
    )
  ) as "Director",
  json_agg(
    distinct jsonb_build_object(
      'ID',
      a.id,
      'First name',
      a.first_name,
      'Last name',
      a.last_name,
      'Photo',
      json_build_object(
        'File name',
        af.file_name,
        'Mime type',
        af.mime_type,
        'Url',
        af.url
      )
    )
  ) filter (
    where
      a.id is not null
  ) as "Actors",
  json_agg(
    distinct jsonb_build_object('ID', g.id, 'Name', g.name)
  ) filter (
    where
      g.id is not null
  ) as "Genres"
from
  "Movie" m
  left join "File" f on m.poster_id = f.id
  left join "Person" d on m.director_id = d.id
  left join "File" pf on d.primary_photo_id = pf.id
  left join "Character" c on c.movie_id = m.id
  left join "Person" a on c.actor_id = a.id
  left join "File" af on a.primary_photo_id = af.id
  left join "MovieGenres" mg on mg.movie_id = m.id
  left join "Genre" g on g.id = mg.genre_id
where
  m.id = 1
group by
  m.id,
  f.id,
  d.id,
  pf.id;
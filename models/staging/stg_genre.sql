SELECT
    GenreId      AS genre_id,
    Name         AS genre_name,
    SYSDATE()    AS insertion_timestamp
FROM
    {{ source('chinook', 'genre') }} AS genre
SELECT
    AlbumId        AS album_id,
    Title          AS album_title,
    ArtistId       AS artist_id,
    SYSDATE()      AS insertion_timestamp
FROM
    {{ source('chinook', 'album') }} AS album
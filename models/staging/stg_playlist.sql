SELECT
    PlaylistId     AS playlist_id,
    Name           AS playlist_name,
    SYSDATE()      AS insertion_timestamp
FROM
    {{ source('chinook', 'playlist') }} AS playlist    
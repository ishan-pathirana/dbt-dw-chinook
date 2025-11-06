SELECT
    PlaylistId  AS playlist_id,
    TrackId     AS track_id,
    SYSDATE()   AS insertion_timestamp,
FROM
    {{ source('chinook', 'playlisttrack') }} AS playlist_track
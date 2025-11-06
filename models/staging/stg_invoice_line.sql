SELECT 
    InvoiceLineId   AS invoice_line_id,
    InvoiceId       AS invoice_id,
    TrackId         AS track_id,
    UnitPrice       AS unit_price,
    Quantity        AS quantity,
    SYSDATE()       AS insertion_timestamp
FROM 
    {{ source('chinook', 'invoiceline') }} AS invoice_line
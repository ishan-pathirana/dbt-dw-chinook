SELECT
    InvoiceId           AS invoice_id, 
    CustomerId          AS customer_id,
    InvoiceDate         AS invoice_date,    
    BillingAddress      AS billing_address,
    BillingCity         AS billing_city,
    BillingState        AS billing_state,
    BillingCountry      AS billing_country,
    BillingPostalCode   AS billing_postal_code,
    Total               AS invoice_total,   
    SYSDATE()           AS insertion_timestamp
FROM 
    {{ source('chinook', 'invoice') }} AS invoice

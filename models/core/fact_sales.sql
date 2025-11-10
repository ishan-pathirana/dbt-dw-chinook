SELECT 
    invoice_line.invoice_line_id,
    invoice_line.invoice_id,
    invoice_line.track_id,
    invoice_line.unit_price,
    invoice_line.quantity,
    invoice.customer_id,
    invoice.invoice_date,
    invoice.billing_address,
    invoice.billing_city,
    invoice.billing_state,
    invoice.billing_country,
    invoice.billing_postal_code,
    invoice.invoice_total,
    SYSDATE() AS insertion_timestamp
FROM 
    {{ ref('stg_invoice_line')}} AS invoice_line
JOIN 
    {{ ref('stg_invoice')}} AS invoice
    ON invoice_line.invoice_id = invoice.invoice_id
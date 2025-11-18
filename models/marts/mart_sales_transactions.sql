SELECT
    dim_customer.customer_id,
    dim_customer.customer_first_name,
    dim_customer.customer_last_name,
    dim_customer.customer_company,
    dim_customer.customer_address,
    dim_customer.customer_city,
    dim_customer.customer_state,
    dim_customer.customer_country,
    dim_customer.customer_postal_code,
    dim_customer.customer_phone,
    dim_customer.customer_fax,
    dim_customer.customer_email,
    dim_customer.customer_support_rep_id,
    dim_employee.employee_id,
    dim_employee.employee_first_name,
    dim_employee.employee_last_name,
    dim_employee.employee_title,
    dim_employee.employee_reports_to,
    dim_employee.employee_birth_date,
    dim_employee.employee_hire_date,
    dim_employee.employee_address,
    dim_employee.employee_city,
    dim_employee.employee_state,
    dim_employee.employee_country,
    dim_employee.employee_postal_code,
    dim_employee.employee_phone,
    dim_employee.employee_fax,
    dim_employee.employee_email,
    fact_sales.invoice_line_id,
    fact_sales.invoice_id,
    fact_sales.track_id,
    fact_sales.unit_price,
    fact_sales.quantity,
    fact_sales.invoice_date,
    fact_sales.billing_address,
    fact_sales.billing_city,
    fact_sales.billing_state,
    fact_sales.billing_country,
    fact_sales.billing_postal_code,
    fact_sales.invoice_total,
    dim_date.date_id,
    dim_date.full_date,
    dim_date.year,
    dim_date.year_week,
    dim_date.year_day,
    dim_date.month,
    dim_date.month_name,
    dim_date.day_name,
    dim_date.week_day_num,
    dim_date.fiscal_year,
    dim_date.fiscal_qtr,
    SYSDATE() AS insertion_timestamp
FROM
    {{ ref('fact_sales') }} fact_sales
JOIN
    {{ ref('dim_customer') }} dim_customer
    ON fact_sales.customer_id = dim_customer.customer_id
JOIN
    {{ ref('dim_employee') }} dim_employee
    ON dim_customer.customer_support_rep_id = dim_employee.employee_id
JOIN
    {{ ref('dim_date') }} dim_date
    ON DATE(fact_sales.invoice_date) = dim_date.full_date
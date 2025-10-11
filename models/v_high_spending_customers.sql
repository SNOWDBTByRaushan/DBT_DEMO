{{config(materialized= 'view')}}

WITH CUSTOMERS AS 
(
    SELECT
    *
    FROM {{ source('demo', 'dim_customer') }}
),SALES AS 
(
    SELECT
    *
    FROM {{ source('demo', 'fact_sales') }}
    WHERE GROSS_AMOUNT > '250'
    AND UPPER(PAYMENT_METHOD) ='CARD'
)
SELECT 
C.*,
S.GROSS_AMOUNT,
S.DISCOUNT_AMOUNT
FROM CUSTOMERS C
LEFT JOIN SALES S
ON S.CUSTOMER_SK = C.CUSTOMER_SK
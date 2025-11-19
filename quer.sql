WITH A AS (
    SELECT * 
    FROM Transactions T
    JOIN Companies C
    ON T.company_id = C.id
),

B as (
    SELECT *,
    LAST_VALUE(transaction_date) OVER(
        PARTITION BY company_id
        ORDER BY transaction_date
    ) AS last_
    FROM Transactions

)

SELECT *
FROM Companies C
JOIN Transactions T
ON 
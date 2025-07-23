SELECT
    category,
    SUM(unitssold)
FROM
    salesdata
WHERE
    storeid = 'S001' AND
    date < '2024-01-01' OR
    date > '2024-01-31'
GROUP BY
    category
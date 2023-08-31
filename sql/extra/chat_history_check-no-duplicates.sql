-- Find all rows where chat_id and message contents are the same
SELECT
  *
FROM
  chat_history
WHERE (chat_id, content) IN (
    SELECT chat_id, content
    FROM chat_history
    GROUP BY chat_id, content
    HAVING COUNT(*) > 1
)
ORDER BY
  chat_id
  ,content


-- Try to match message_count with an actually count, but not able to match the numbers
-- Best to check the count by executing this on your old db before merging
WITH
  counter AS (
SELECT
  chat_id
  ,COUNT(DISTINCT id) AS message_count_counted
FROM
  chat_history
WHERE
  -- type = 1
  from_mid IS NOT NULL
  AND type NOT IN (8)
GROUP BY
  chat_id
)

SELECT
  chat.chat_id
  ,message_count
  ,message_count_counted
FROM
  chat
  LEFT JOIN counter ON chat.chat_id = counter.chat_id
WHERE
  message_count != message_count_counted
ORDER BY
  message_count


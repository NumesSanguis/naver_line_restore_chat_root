-- Add rows from old db not found; can take a few minutes if old db is large
-- Looks like some messages are inserted double, but that was already the case in the old db
INSERT INTO chat_history
SELECT
  *
FROM
  old.chat_history
WHERE
  (chat_id, created_time) NOT IN (SELECT chat_id, created_time FROM chat_history);


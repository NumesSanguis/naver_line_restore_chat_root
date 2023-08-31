INSERT INTO chat
SELECT
  *
FROM
  old.chat
WHERE
  chat_id NOT IN (SELECT chat_id FROM chat);


-- Add rows from old db not found;
INSERT INTO chat_member
SELECT
  *
FROM
  old.chat_member
WHERE
  (chat_id, mid) NOT IN (SELECT chat_id, mid FROM chat_member);


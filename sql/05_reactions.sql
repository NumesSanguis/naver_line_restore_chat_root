-- Add rows from old db not found
INSERT INTO reactions
SELECT
  *
FROM
  old.reactions
WHERE
  (server_message_id, member_id, chat_id) NOT IN (SELECT server_message_id, member_id, chat_id FROM reactions);


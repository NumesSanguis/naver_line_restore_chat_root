-- as we inserted more rows in chat_history, this should be updated to match last message id
UPDATE sqlite_sequence
SET seq = (SELECT MAX(id) FROM chat_history);


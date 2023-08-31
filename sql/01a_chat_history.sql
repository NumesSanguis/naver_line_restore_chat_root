UPDATE chat_history
SET id = id + (SELECT MAX(id) FROM old.chat_history);


-- OPTIONAL: I cannot replicate the number `message_count`, so might be safer not to update
-- See `extra/chat_message-count-check_chat_history.sql` for my attempt of matching the numbers
UPDATE chat
SET 
    message_count = (
        SELECT COUNT(*)
        FROM chat_history
        WHERE chat.chat_id = chat_history.chat_id
    ),
    read_message_count = (
        SELECT COUNT(*)
        FROM chat_history
        WHERE chat.chat_id = chat_history.chat_id
    );


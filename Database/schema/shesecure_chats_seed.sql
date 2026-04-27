USE shesecure;
INSERT INTO chats (sender_id, receiver_id, message, message_type)
VALUES 
(1, 2, 'Are you reaching the safe zone shortly?', 'text'),
(2, 1, 'Yes, just reached. Sending my current location.', 'text');
select * from chats;

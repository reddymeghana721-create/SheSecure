CREATE TABLE chats (
    message_id INT AUTO_INCREMENT PRIMARY KEY,

    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,

    message TEXT NOT NULL,
    message_type ENUM('text','image','location','sos','system') DEFAULT 'text',

    is_read BOOLEAN DEFAULT FALSE,
    delivered_at TIMESTAMP NULL,
    read_at TIMESTAMP NULL,

    attachment_url VARCHAR(255),
    reply_to_message_id INT NULL,

    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_id) REFERENCES users(user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (receiver_id) REFERENCES users(user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (reply_to_message_id) REFERENCES chats(message_id)
        ON DELETE SET NULL
);

desc chats;
select * from chats;
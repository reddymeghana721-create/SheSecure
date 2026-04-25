CREATE TABLE sos_alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    triggered_by ENUM('button','shake','manual','voice') NOT NULL,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    emergency_message VARCHAR(255) DEFAULT 'Need Help!',
    status ENUM('Active','Resolved','Cancelled') DEFAULT 'Active',
    battery_level INT,
    network_status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP NULL,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
);
DESC sos_alerts;
SELECT * FROM sos_alerts;
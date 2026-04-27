CREATE TABLE complaints (
    complaint_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,

    category ENUM(
        'Harassment',
        'Stalking',
        'Ride Issue',
        'Unsafe Area',
        'Police Misconduct',
        'App Bug',
        'Fake Profile',
        'Other'
    ) NOT NULL,

    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,

    priority ENUM('Low','Medium','High','Critical') DEFAULT 'Medium',

    evidence_url VARCHAR(255),

    status ENUM(
        'Pending',
        'In Review',
        'Assigned',
        'Resolved',
        'Rejected'
    ) DEFAULT 'Pending',

    admin_remarks TEXT,
    assigned_to INT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    resolved_at TIMESTAMP NULL,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

desc complaints;
select * from complaints;
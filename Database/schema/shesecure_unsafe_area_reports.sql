CREATE TABLE unsafe_area_reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,

    issue_type ENUM(
        'Harassment',
        'Stalking',
        'Theft',
        'Dark Area',
        'Suspicious Activity',
        'No Police Presence',
        'Unsafe Road',
        'Other'
    ) NOT NULL,

    description TEXT,
    severity_level ENUM('Low','Medium','High') DEFAULT 'Medium',
    anonymous_report BOOLEAN DEFAULT FALSE,
    evidence_url VARCHAR(255),
    status ENUM('Pending','Verified','Rejected','Resolved') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reviewed_at TIMESTAMP NULL,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
);

DESC unsafe_area_reports;
SELECT * FROM unsafe_area_reports; 
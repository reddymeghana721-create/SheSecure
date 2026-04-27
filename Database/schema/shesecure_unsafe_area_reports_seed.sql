USE shesecure;
INSERT INTO unsafe_area_reports (user_id, latitude, longitude, issue_type, description, severity_level)
VALUES 
(1, 18.530000, 73.860000, 'Dark Area', 'Street lights not working near the main gate.', 'High'),
(2, 18.480000, 73.810000, 'Suspicious Activity', 'Group of people loitering near the transit point.', 'Medium');

select * from unsafe_area_reports;
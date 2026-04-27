USE shesecure;
INSERT INTO complaints (user_id, category, title, description, priority, status)
VALUES 
(1, 'App Bug', 'Location Delay', 'Live location updates are lagging by 30 seconds.', 'Medium', 'In Review'),
(2, 'Harassment', 'Stalking Incident', 'Reported a suspicious vehicle following the ride.', 'Critical', 'Assigned');
select * from complaints;

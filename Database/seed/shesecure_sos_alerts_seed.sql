USE shesecure;
INSERT INTO sos_alerts (user_id, triggered_by, latitude, longitude, emergency_message, status, battery_level, network_status) VALUES 
(1, 'shake', 18.5204, 73.8567, 'Test alert from Shaniwar Wada', 'Resolved', 80, '4G'),
(2, 'button', 18.5590, 73.7799, 'Test alert from BT Kawade', 'Active', 45, '5G');
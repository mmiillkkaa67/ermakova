--1.
SELECT d.name, e.event_time, e.event_type, e.value
FROM events e
JOIN devices d ON d.device_id = e.device_id
WHERE d.name = 'Термостат-01'
ORDER BY e.event_time;
--2.
SELECT event_type, COUNT(*) AS cnt
FROM events
GROUP BY event_type;
--3.
SELECT d.name, d.location, COUNT(*) AS errors
FROM devices d
JOIN events e ON e.device_id = d.device_id
WHERE e.event_type = 'ошибка'
GROUP BY d.device_id, d.name, d.location
HAVING COUNT(*) > 1;
--4.
SELECT d.name, MAX(e.event_time) AS last_event
FROM devices d
JOIN events e ON e.device_id = d.device_id
GROUP BY d.device_id, d.name;
--5.
SELECT d.name, d.location
FROM devices d
LEFT JOIN events e
ON e.device_id = d.device_id AND e.event_type = 'ошибка'
WHERE e.event_id IS NULL;

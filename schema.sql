CREATE TABLE devices (
device_id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
location TEXT NOT NULL
);
CREATE TABLE events (
event_id INTEGER PRIMARY KEY,
device_id INTEGER NOT NULL,
event_time TEXT NOT NULL,
event_type TEXT NOT NULL
CHECK (event_type IN ('включение','выключение','показание','ошибка')),
value REAL,
FOREIGN KEY (device_id) REFERENCES devices (device_id)
);

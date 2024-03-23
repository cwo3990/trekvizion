DROP TABLE IF EXISTS hike;
DROP TABLE IF EXISTS poi;
DROP TABLE IF EXISTS poi_photo;
DROP TABLE IF EXISTS hiker;
DROP TABLE IF EXISTS trip_plan;
DROP TABLE IF EXISTS trip_hiker;
DROP TABLE IF EXISTS hike_hiker;

CREATE TABLE hike
(
    id                           TEXT PRIMARY KEY,
    is_paused                    BOOLEAN DEFAULT 0,
    map_photo                    TEXT,
    user_notes                   TEXT,
    user_rating                  INTEGER,
    emergency_contact_phone      TEXT,
    emergency_services_phone     TEXT,
    started_at                   TIMESTAMP,
    estimated_to_complete_at     TIMESTAMP,
    actually_completed_at        TIMESTAMP,
    start_coordinates            POINT,
    end_coordinates              POINT,
    total_distance               TEXT,
    distance_calculated_up_until POINT
);

CREATE TABLE poi
(
    id              TEXT PRIMARY KEY,
    hike_id         TEXT REFERENCES hike (id),
    user_notes      TEXT,
    map_coordinates POINT
);

CREATE TABLE poi_photo
(
    id       TEXT PRIMARY KEY,
    poi_id   TEXT REFERENCES poi (id),
    filepath TEXT
);

CREATE TABLE hiker
(
    id          TEXT PRIMARY KEY,
    name        TEXT,
    phone       TEXT,
    picture_url TEXT
);

CREATE TABLE hike_hiker
(
    id       TEXT PRIMARY KEY,
    hike_id  TEXT REFERENCES hike (id),
    hiker_id TEXT REFERENCES hiker (id)
);

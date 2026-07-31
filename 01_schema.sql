-- club_db — Schema
-- PostgreSQL 18
-- Run this first, then 02_seed.sql

DROP TABLE IF EXISTS equipment, membership_fee, event_rsvp, event,
                     member_committee, committee, member CASCADE;

CREATE TABLE member (
    member_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    email       VARCHAR(320) NOT NULL UNIQUE,
    join_date   DATE         NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE committee (
    committee_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name         VARCHAR(100) NOT NULL UNIQUE,
    created_date DATE         NOT NULL,
    chair_id     INTEGER      UNIQUE REFERENCES member(member_id) ON DELETE SET NULL
);

CREATE TABLE member_committee (
    member_id    INTEGER     NOT NULL REFERENCES member(member_id)       ON DELETE CASCADE,
    committee_id INTEGER     NOT NULL REFERENCES committee(committee_id) ON DELETE CASCADE,
    role         VARCHAR(50) NOT NULL DEFAULT 'Member',
    joined_on    DATE        NOT NULL,
    PRIMARY KEY (member_id, committee_id)
);

CREATE TABLE event (
    event_id     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title        VARCHAR(150) NOT NULL,
    event_time   TIMESTAMP    NOT NULL,
    location     VARCHAR(255),
    committee_id INTEGER      NOT NULL REFERENCES committee(committee_id) ON DELETE CASCADE
);

CREATE TABLE event_rsvp (
    member_id INTEGER   NOT NULL REFERENCES member(member_id) ON DELETE CASCADE,
    event_id  INTEGER   NOT NULL REFERENCES event(event_id)   ON DELETE CASCADE,
    rsvp_time TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (member_id, event_id)
);

CREATE TABLE membership_fee (
    payment_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id    INTEGER      NOT NULL REFERENCES member(member_id) ON DELETE CASCADE,
    amount       NUMERIC(8,2) NOT NULL CHECK (amount > 0),
    payment_date DATE         NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE equipment (
    equipment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    event_id     INTEGER,
    eq_name      VARCHAR(30) NOT NULL,
    eq_state     VARCHAR(30) NOT NULL,
    CONSTRAINT fk_event_equipment
        FOREIGN KEY (event_id) REFERENCES event(event_id)
);

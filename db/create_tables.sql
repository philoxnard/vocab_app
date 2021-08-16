-- Create and/or reset the local database with the following commands.
-- Conda env has to be created and activated in order to use sqlite3.
-- Make sure vocab_app/db is your working directory.
-- sqlite3 database.db  <== Start the SQLite program.  Use/create a file called database.db
-- .read create_tables.sql  <== Runs this script
-- .tables   <== result should list the 4 tables by name
-- .q  <== to quit.

PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS vocab;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS exercises;


CREATE TABLE users (
    username TEXT PRIMARY KEY,
    exercise_access INTEGER NOT NULL,
    admin_access INTEGER NOT NULL
);


CREATE TABLE sessions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    start_time TEXT NOT NULL,
    end_time TEXT,
    FOREIGN KEY (username)
        REFERENCES users (username)
);


CREATE TABLE vocab (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    english_translation TEXT NOT NULL,
    german_translation TEXT NOT NULL,
    part_of_speech TEXT NOT NULL,
    CHECK (part_of_speech = "VERB"
            OR part_of_speech = "NOUN"
            OR part_of_speech = "ADJECTIVE")
);


CREATE TABLE exercises (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id INTEGER NOT NULL,
    vocab_id INTEGER NOT NULL,
    direction TEXT NOT NULL,
    option_a INTEGER NOT NULL,
    option_b INTEGER NOT NULL,
    option_c INTEGER NOT NULL,
    option_d INTEGER NOT NULL,
    user_response TEXT NOT NULL,
    correct_response TEXT NOT NULL,
    answered_at TEXT NOT NULL,
    FOREIGN KEY (session_id)
        REFERENCES sessions (id)
    FOREIGN KEY (vocab_id)
        REFERENCES vocab (id)
    FOREIGN KEY (option_a)
        REFERENCES vocab (id)
    FOREIGN KEY (option_b)
        REFERENCES vocab (id)
    FOREIGN KEY (option_c)
        REFERENCES vocab (id)
    FOREIGN KEY (option_d)
        REFERENCES vocab (id)
    CHECK (direction = "ENG TO GER"
            OR direction  = "GER TO ENG")
    CHECK (user_response = "A"
            OR user_response = "B"
            OR user_response = "C"
            OR user_response = "D")
    CHECK (correct_response = "A"
            OR correct_response = "B"
            OR correct_response = "C"
            OR correct_response = "D")
);


-- To run this script, first make sure the conda env is activated.
-- Then, open up sqlite with the `sqlite3` command.
-- Then you can run this script line-by-line at the command prompt, or
-- alternatively just run the file with `.read insert_dummy_data.sql`
-- `.q` quits sqlite


BEGIN;

INSERT INTO users (username, exercise_access, admin_access) VALUES
    ('Philip', 1, 1),
    ('David', 1, 1);

INSERT INTO sessions (username, start_time, end_time) VALUES
    ('Philip', '2021-07-21 12:00:00', '2021-07-21 12:30:00'),
    ('Philip', '2021-08-01 12:00:00', '2021-08-01 12:30:00'),
    ('David', '2021-08-03 12:00:00', '2021-08-03 12:30:00');

INSERT INTO vocab (english_translation, german_translation, part_of_speech) VALUES
    ('Onion Cake', 'der Zwiebelkuchen', 'NOUN'),
    ('Nincompoop', 'der Trottel', 'NOUN'),
    ('fressen', 'to gobble up', 'VERB'),
    ('pathetic', 'erbärmlich', 'ADJECTIVE');

INSERT INTO exercises (session_id, vocab_id, direction, option_a, option_b,
    option_c, option_d, user_response, correct_response, answered_at) VALUES
    (1, 1, "ENG TO GER", 1, 2, 3, 4, "A", "A", "2021-07-21 12:01:00"),
    (1, 2, "ENG TO GER", 1, 2, 3, 4, "B", "A", "2021-07-21 12:01:00");

COMMIT;
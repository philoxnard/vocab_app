# vocab_app
A simple language learning app

## Some initial setup
1. Create the conda environment with `conda env create --file /path/to/conda_env.yaml`
3. Add VSCode-specific files to .gitignore

## Database
Create a local database instance by following the commands listed in `db/create_tables.sql`.  I recommend setting your working directory to `vocab_app/db` before running `sqlite3` commands.

That script creates the tables with the table names, column names, and some constraints on the values in some of the columns.

Next, run the script `insert_dummy_data.sql`.  This will insert a couple of rows into the data tables.
 
You can try playing around if you want by running the `sqlite3` command on the command line and trying to insert more rows or extract data out of the tables with SQL queries.

There are a lot of online resources for writing SQL queries.  Here are a few to get the idea:

- `SELECT * FROM users;`
- `SELECT german_translation, part_of_speech FROM vocab;`
- `SELECT * FROM sessions WHERE username = 'Philip';`

P.S. SQLite is _really_ picky about semicolon usage. If it seems like the command prompt is asking you to finish your query, 9 times out of 10 it's because you forgot a semicolon.

You can always rerun the `.read create_tables.sql` command to reset with an empty DB.  After running that, you will be able to run `.read insert_dummy_data.sql` one time to populate the data tables, but the script will fail on subsequent runs (can you figure out why?).  You can also just delete the database.db file to reset things too. 
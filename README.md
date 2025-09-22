# PostgreSQL Connection Demo

This project demonstrates how to connect to a PostgreSQL database using Python and the psycopg2 library.

## Files

- `postgres_connection_demo.py` - The main Python script that connects to PostgreSQL
- `README.md` - This file

## Requirements

- Python 3.x
- psycopg2-binary library
- PostgreSQL database server

## Installation

1. Install the required Python package:
   ```
   pip install psycopg2-binary python-dotenv
   ```

## Usage

1. Make sure your PostgreSQL server is running
2. Set up your database connection parameters using environment variables:
   - `DB_HOST` (default: localhost)
   - `DB_NAME` (default: postgres)
   - `DB_USER` (default: postgres)
   - `DB_PASSWORD` (default: empty)
   - `DB_PORT` (default: 5432)
   
   Or create a `.env` file with these variables:
   ```
   DB_HOST=localhost
   DB_NAME=your_database_name
   DB_USER=your_username
   DB_PASSWORD=your_password
   DB_PORT=5432
   ```

3. Run the script:
   ```
   python postgres_connection_demo.py
   ```

## What the Script Does

1. Connects to a PostgreSQL database
2. Creates a sample table with a random name
3. Inserts sample data into the table
4. Fetches and displays the data
5. Closes the database connection

## Security Note

For production use, never hardcode database credentials in your source code. Always use environment variables or secure configuration files.
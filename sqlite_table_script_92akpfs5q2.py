#!/usr/bin/env python3
"""
A Python script that creates a SQLite table.
This script creates a sample 'users' table with id, name, and email columns.
"""

import sqlite3
import os
import random
import string

def create_sqlite_table():
    """
    Creates a SQLite database and a sample table.
    """
    # Generate a random database name
    db_name = 'sample_db_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.db'
    
    # Connect to SQLite database (creates it if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Create a sample table
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    
    # Insert some sample data
    sample_users = [
        ('Alice Johnson', 'alice@example.com'),
        ('Bob Smith', 'bob@example.com'),
        ('Charlie Brown', 'charlie@example.com')
    ]
    
    cursor.executemany('INSERT INTO users (name, email) VALUES (?, ?)', sample_users)
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"SQLite table 'users' created successfully in database: {db_name}")
    print(f"Sample data inserted. Total records: {len(sample_users)}")
    
    # Show the created table structure
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    cursor.execute("PRAGMA table_info(users)")
    columns = cursor.fetchall()
    
    print("\nTable structure:")
    for col in columns:
        print(f"  - {col[1]} ({col[2]}) {'PRIMARY KEY' if col[5] else ''}")
    
    conn.close()

if __name__ == "__main__":
    create_sqlite_table()
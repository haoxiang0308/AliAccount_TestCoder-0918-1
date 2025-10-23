import configparser
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .ini extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.ini"

def create_database_ini():
    """Create an INI file with database settings"""
    # Create a ConfigParser object
    config = configparser.ConfigParser()
    
    # Add database section
    config['database'] = {
        'host': 'localhost',
        'port': '5432',
        'username': 'admin',
        'password': 'securepassword',
        'database_name': 'myapp_db',
        'ssl_mode': 'require'
    }
    
    # Add connection pool settings
    config['connection_pool'] = {
        'min_connections': '5',
        'max_connections': '20',
        'timeout': '30'
    }
    
    # Generate random filename
    filename = generate_random_filename()
    
    # Write the configuration to the file
    with open(filename, 'w') as configfile:
        config.write(configfile)
    
    print(f"Database configuration saved to: {filename}")
    return filename

if __name__ == "__main__":
    create_database_ini()
#!/usr/bin/env python3
"""
MySQL Server Connection Script
Creates the alx_book_store database if it doesn't exist
"""

import mysql.connector
from mysql.connector import Error

def create_database(host='localhost', user='root', password=''):
    """
    Creates the alx_book_store database in MySQL server
    
    Args:
        host (str): MySQL host address
        user (str): MySQL username
        password (str): MySQL password
    """
    connection = None
    try:
        # Connect to MySQL server without specifying a database
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Create database if it doesn't exist
            create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
            cursor.execute(create_db_query)
            
            print("Database 'alx_book_store' created successfully!")
            
            # Get MySQL server info
            db_info = connection.get_server_info()
            print(f"Connected to MySQL Server version: {db_info}")
            
    except Error as e:
        print(f"Error: {e}")
        print("Failed to connect to MySQL server")
        print("except mysql.connector.Error")
    finally:
        # Close connection properly
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")

def main():
    """
    Main function to execute database creation
    """
    print("Attempting to create database 'alx_book_store'...")
    
    # You can modify these credentials as needed
    host = 'localhost'
    user = 'root'
    password = ''  # Set your MySQL password here
    
    create_database(host, user, password)

if __name__ == "__main__":
    main()


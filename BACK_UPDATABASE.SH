#!/bin/bash

# variables

DB_NAME="my_database"
DB_USER="admin"
DB_PASSWORD="root"
BACKUP_DIR="/backup/mysql"
DATE=$(date %Y-%m-%d)

mkdir -p $BACKUP_DIR

mysqldump -u $DB_USER -p $DB_PASSWORD $DB_NAME > $BACKUP_DIR/${DB_NAME}_$DATE.sql

    #verify_backup

    if [ $? -eq 0 ]; then
      
      echo "Backup Successful : $BACKUP_DIR/${DB_NAME}_$DATE.sql"
      else
      echo "backup faild"
    fi


    # Let’s break down this Bash script step by step:

# 1. Shebang
# #!/bin/bash
# Indicates that the script should be executed using the Bash shell.
# 2. Variables
# DB_NAME="my_database"
# DB_USER="db_user"
# DB_PASS="db_password"
# BACKUP_DIR="/backup/mysql"
# DATE=$(date +%Y-%m-%d)
# DB_NAME: The name of the database to back up (e.g., my_database).
# DB_USER: The username for database authentication.
# DB_PASS: The password for the database user.
# Note: For security, avoid hardcoding passwords; use environment variables or secure vaults instead.
# BACKUP_DIR: The directory where the backup files will be stored.
# DATE: Captures the current date in YYYY-MM-DD format using the date command. This ensures each backup file has a unique timestamp.
# 3. Create Backup Directory
# mkdir -p $BACKUP_DIR
# mkdir -p:
# Creates the directory specified in $BACKUP_DIR if it does not already exist.
# The -p option ensures no error is thrown if the directory already exists.
# 4. Perform the Database Backup
# echo "Backing up database..."
# mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/${DB_NAME}_$DATE.sql
# echo: Prints a message indicating the backup process has started.
# mysqldump:
# A MySQL utility used to export the database structure and data into a .sql file.
# -u $DB_USER: Specifies the database username.
# -p$DB_PASS: Specifies the password for the user (no space between -p and the password).
# $DB_NAME: The name of the database to back up.
# >: Redirects the output of mysqldump to a file.
# $BACKUP_DIR/${DB_NAME}_$DATE.sql: Specifies the backup file's path and name, incorporating the current date.
# 5. Verify Backup
# if [ $? -eq 0 ]; then
#     echo "Backup successful: $BACKUP_DIR/${DB_NAME}_$DATE.sql"
# else
#     echo "Backup failed!"
#     exit 1
# fi
# $?: Captures the exit status of the last executed command (mysqldump in this case).
# 0: Success.
# Non-zero: Failure.
# If Block:
# If the backup succeeds ($? -eq 0), it prints:
# Backup successful: /backup/mysql/my_database_YYYY-MM-DD.sql
# If the backup fails (non-zero exit status), it prints an error message and exits the script with a status code of 1:
# Backup failed!
# How It Works in Action
# Setup:
# Define the database credentials, backup location, and current date.
# Create the backup directory if it doesn't exist.
# Backup:
# Use mysqldump to create a .sql file containing the database’s contents.
# Validation:
# Check if the mysqldump command was successful and provide feedback.
# Example Output
# Successful Backup:
# Backing up database...
# Backup successful: /backup/mysql/my_database_2024-11-27.sql
# Failed Backup:
# Backing up database...
# Backup failed!
# Use Case
# Automating MySQL database backups.
# Ensuring that backups are timestamped for easier identification and management.

# Best Practices
# Password Security:

# Avoid hardcoding the password in the script.
# Use environment variables or tools like AWS Secrets Manager, Vault, or .my.cnf file.
# [client]
# user=db_user
# password=db_password
# Modify the mysqldump command to:
# mysqldump --defaults-file=/path/to/.my.cnf $DB_NAME > $BACKUP_DIR/${DB_NAME}_$DATE.sql
# Error Handling:

# Check for disk space before proceeding.
# Notify via email or monitoring tools if the backup fails.
# Automation:

# Schedule the script using cron for periodic backups:
# 0 2 * * * /path/to/backup-script.sh
# Let me know if you need help implementing enhancements!












#!/bin/bash

LOG_DIR="/var/log/myapp"
RETENTION_DAYS=7

echo "cleaning up log oder than $RETENTION_DAYS in the $LOG_DIR"

find $LOG_DIR -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "the logs are cleaned up"


# Let’s break down this Bash script step by step:

# 1. Shebang (#!/bin/bash)
# Purpose: Indicates that the script should be executed using the Bash shell.
# Every Bash script begins with this line to tell the system which interpreter to use.
# 2. Variables
# LOG_DIR="/var/log/myapp"
# RETENTION_DAYS=7
# LOG_DIR: Specifies the directory where the application logs are stored. In this example, logs are located in /var/log/myapp.
# RETENTION_DAYS: Defines how old the logs can be before they are deleted. Here, any log files older than 7 days will be removed.
# 3. Comment
# # Find and delete logs older than retention period
# A comment explaining what the following code does. Comments in scripts are prefixed with # and are ignored during execution.
# 4. echo Command
# echo "Cleaning up logs older than $RETENTION_DAYS days in $LOG_DIR..."
# Purpose: Prints a message to the terminal to indicate the action being performed.
# It dynamically uses the values of the variables $RETENTION_DAYS and $LOG_DIR to make the message informative.
# 5. find Command
# find $LOG_DIR -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;
# This is the core of the script. Let’s break it down:
# find $LOG_DIR:
# Looks for files within the directory specified by $LOG_DIR (/var/log/myapp in this case).
# -type f:
# Specifies that only files (not directories) should be considered.
# -mtime +$RETENTION_DAYS:
# Filters files that were last modified more than 7 days ago. The + indicates "older than."
# -exec rm -f {} \;:
# Executes the rm command (force delete) on each file found.
# {} is a placeholder for the current file found.
# \; marks the end of the -exec command.
# 6. Completion Message
# echo "Log cleanup completed."
# Prints a message indicating that the log cleanup process is finished.
# How It Works in Action
# The script searches the directory /var/log/myapp.
# It looks for files older than 7 days (-mtime +7).
# It deletes these files one by one (rm -f).
# It provides feedback to the user before and after performing the cleanup.


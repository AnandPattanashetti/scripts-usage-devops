#!/bin/bash

THRESHOLD=80
ALERT_EMAIL="anandshetty010@gmail.com"


# Check disk usage
echo "Checking disk usage..."
df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5 " " $6}' | while read output; do
    usage=$(echo $output | awk '{print $1}' | sed 's/%//g')
    partition=$(echo $output | awk '{print $2}')
    
    if [ $usage -ge $THRESHOLD ]; then
        echo "Disk usage alert: $partition at ${usage}%" | mail -s "Disk Usage Alert" $ALERT_EMAIL
    fi
done




# Let's break down this disk usage monitoring script step by step:

# 1. Shebang
# #!/bin/bash
# Indicates that the script will execute using the Bash shell.
# 2. Variables
# THRESHOLD=80
# ALERT_EMAIL="admin@example.com"
# THRESHOLD: Sets the disk usage percentage limit (80% in this case). If any partition's usage exceeds this limit, an alert is triggered.
# ALERT_EMAIL: The email address where disk usage alerts will be sent.
# 3. Disk Usage Check
# echo "Checking disk usage..."
# Prints a message indicating that the script is starting to check disk usage.
# 4. List Disk Usage
# df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5 " " $6}'
# df -h:
# Displays the disk usage of all mounted partitions in a human-readable format.
# grep -vE '^Filesystem|tmpfs|cdrom':
# Filters out irrelevant lines:
# ^Filesystem: Excludes the header row.
# tmpfs: Excludes temporary filesystems.
# cdrom: Excludes CD-ROM devices.
# awk '{print $5 " " $6}':
# Extracts the percentage of usage ($5) and the partition name ($6).
# 5. Process Each Partition
# while read output; do
#     usage=$(echo $output | awk '{print $1}' | sed 's/%//g')
#     partition=$(echo $output | awk '{print $2}')
# while read output; do:
# Iterates over each line of filtered disk usage output.
# Extract Disk Usage and Partition:
# usage=$(echo $output | awk '{print $1}' | sed 's/%//g'):
# Extracts the usage percentage (e.g., "85%") and removes the % sign using sed.
# partition=$(echo $output | awk '{print $2}'):
# Extracts the partition name (e.g., / for the root filesystem).
# 6. Check Usage Against Threshold
# if [ $usage -ge $THRESHOLD ]; then
#     echo "Disk usage alert: $partition at ${usage}%" | mail -s "Disk Usage Alert" $ALERT_EMAIL
# fi
# Condition:
# Checks if the disk usage percentage ($usage) is greater than or equal to the threshold ($THRESHOLD).
# Send Alert:
# If the condition is met:
# Constructs an alert message:
# Disk usage alert: / at 85%
# Sends the alert via email using the mail command.
# -s: Specifies the subject of the email.
# $ALERT_EMAIL: The recipient email address.
# How It Works
# The script retrieves the disk usage for all partitions.
# It filters out unnecessary entries (like headers or temporary filesystems).
# For each remaining partition:
# It checks if the disk usage exceeds the defined threshold (e.g., 80%).
# If the threshold is exceeded, an email alert is sent to the specified recipient.
# Example Output
# If the partition / has 85% usage:

# Checking disk usage...
# Disk usage alert: / at 85%
# An email will be sent with:

# Subject: Disk Usage Alert
# Body: Disk usage alert: / at 85%
# Use Case
# Automating disk usage monitoring in servers.
# Sending proactive alerts to system administrators to prevent disk space exhaustion.
# Best Practices
# Email Configuration:

# Ensure the mail command is properly configured (e.g., with Postfix or Sendmail).
# Test email functionality beforehand:
# echo "Test email" | mail -s "Test" admin@example.com
# Dynamic Threshold:

# Allow thresholds to be passed as script arguments for flexibility:
# THRESHOLD=${1:-80}  # Use first argument or default to 80
# Logging:

# Log alerts to a file in addition to sending emails:
# echo "Disk usage alert: $partition at ${usage}%" >> /var/log/disk_usage_alerts.log
# Integration with Monitoring Tools:

# Integrate with tools like Nagios, Prometheus, or Grafana for centralized monitoring.
# Improved Filtering:

# Handle specific cases like network-mounted drives (NFS) or avoid alerting on removable devices.

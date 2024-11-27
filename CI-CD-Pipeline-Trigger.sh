#!/bin/bash

JENKINS_URL="https://jenkins.exampple.com/job/myjob/build"
JENKINS_TOKEN="jenkins-token"

echo "triggerring jennkins pipeline"
curl -X POST "$JENKINS_URL?token=$JENKINS_TOKEN"

if [ $? -eq 0 ]; then
   echo "the pipeline triggere successfully"
else
  echo "the pipeline failed to triggered"
  exit 1
fi



# Let’s break down this Bash script step by step:

# 1. Shebang
# #!/bin/bash
# Indicates that the script should be executed using the Bash shell.
# 2. Variables
# JENKINS_URL="http://jenkins.example.com/job/my-pipeline/build"
# TOKEN="my-jenkins-token"
# JENKINS_URL: The URL to trigger a specific Jenkins job or pipeline.
# This example specifies the URL for a pipeline named my-pipeline.
# TOKEN: The API token or authentication token required to securely trigger the Jenkins job.
# 3. Echo Message
# echo "Triggering Jenkins pipeline..."
# Prints a message to the terminal to inform the user that the Jenkins pipeline trigger is in progress.
# 4. Triggering the Jenkins Job
# curl -X POST "$JENKINS_URL?token=$TOKEN"
# curl: A command-line tool used to send HTTP requests.
# -X POST: Specifies an HTTP POST request, which is commonly used to trigger Jenkins builds.
# $JENKINS_URL?token=$TOKEN:
# Combines the Jenkins job URL with the token as a query parameter for authentication.
# Example:
# http://jenkins.example.com/job/my-pipeline/build?token=my-jenkins-token
# 5. $? - Exit Status Check
# if [ $? -eq 0 ]; then
# $?: Stores the exit status of the last executed command (curl in this case).
# A value of 0 indicates success.
# Any other value indicates failure.
# 6. Conditional Logic
# if [ $? -eq 0 ]; then
#     echo "Jenkins pipeline triggered successfully."
# else
#     echo "Failed to trigger Jenkins pipeline."
#     exit 1
# fi
# If Block:
# If the exit status of curl is 0, it prints:
# Jenkins pipeline triggered successfully.
# Else Block:
# If curl fails (non-zero exit status), it prints:
# Failed to trigger Jenkins pipeline.
# The script then exits with a status code of 1 to indicate failure.
# How It Works in Action
# The script sends a POST request to the Jenkins job URL to trigger the pipeline.
# If the request succeeds (exit code 0):
# The user sees a success message.
# If the request fails (non-zero exit code):
# The user sees an error message, and the script exits with a failure code (1).
# Prerequisites for Success
# Jenkins API Token:
# The $TOKEN must be valid and configured in Jenkins.
# Usually generated under Jenkins > User Profile > Configure > API Token.
# Trigger Permissions: The user associated with the token must have permission to trigger builds.
# URL Accuracy: Ensure the $JENKINS_URL is correct, including the pipeline name and parameters.

 
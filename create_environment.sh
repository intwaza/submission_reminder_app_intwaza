#!/bin/bash

# Prompt for name: 
read -rp "Enter your name: " USER_NAME
ROOT_DIR="submission_reminder_${USER_NAME// /-}" # Replace spaces with dashes

# Create the main directory and subdirectories 
mkdir -p "${ROOT_DIR}"/{app,modules,assets,config}

# Create the reminder script 
cat <<EOT > "${ROOT_DIR}/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOT
chmod +x "${ROOT_DIR}/app/reminder.sh"

# Create the functions script
cat <<EOT > "${ROOT_DIR}/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOT
chmod +x "${ROOT_DIR}/modules/functions.sh"

# Create the config file 
cat <<EOT > "${ROOT_DIR}/config/config.env"
# This is the config file
ASSIGNMENT="Permissions & Users"

DAYS_REMAINING=3
EOT

# Create and populate submissions.txt 
cat <<EOT > "${ROOT_DIR}/assets/submissions.txt"
# student,assignment,submission status
Intwaza, Permissions & Users, submitted
Ange, Permissions & Users, not submitted
Kenny, Permissions & Users, not submitted
Belyse, Permissions & Users, submitted
Bella, Permissions & Users, not submitted
Joseph, Permissions & Users, submitted
Fatima, Permissions & Users, not submitted
Halima, Permissions & Users, submitted
William, Permissions & Users, not submitted
Ketty, Permissions & Users, submitted
EOT

# Create the startup script
cat <<EOT > "${ROOT_DIR}/startup.sh"
#!/bin/bash

# Start reminder script if it exists
if [ -f "./app/reminder.sh" ]; then
    echo "Starting the reminder script..."
    bash ./app/reminder.sh
else
    echo "Reminder script not found. Exiting."
fi
EOT
chmod +x "${ROOT_DIR}/startup.sh"

# Make all .sh files executable
find "${ROOT_DIR}" -type f -name "*.sh" -exec chmod +x {} \;

# COMPLETED...Done
echo "Environment setup complete in: $ROOT_DIR"
echo "To test: cd $ROOT_DIR && ./startup.sh"
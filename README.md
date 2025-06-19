# Submission Reminder App

This is a small Linux app that helps you keep track of school assignments and reminds you if you forget to submit them. It’s built using shell scripts, kind of like a list of instructions your computer understan

## 📋  What This Project Does
This app uses two simple scripts (like mini programs) that:

- Set up everything you need with just one click

- Let you change which assignment you’re tracking

- Remind you which students haven’t submitted their work

## 🗂️ Repository Structure

```
submission_reminder_app_intwaza/
├── create_environment.sh     # Main setup script
├── copilot_shell_script.sh   # Configuration management script
└── README.md                 # This file
```

## 🚀 Features

### Environment Setup (`create_environment.sh`)
- **Interactive Setup**: Prompts for user name and creates personalized directory structure
- **Automated Directory Creation**: Sets up organized folder hierarchy for the application
- **File Population**: Automatically creates and populates all necessary configuration and script files
- **Permission Management**: Sets executable permissions for all shell scripts
- **Application Testing**: Includes built-in testing capabilities

### Dynamic Configuration (`copilot_shell_script.sh`)
- **Assignment Management**: Allows users to change the assignment being tracked
- **Real-time Updates**: Modifies configuration files using `sed` commands
- **Instant Reprocessing**: Automatically reruns the application with new settings

## 🛠️ Technologies Used

- **Shell Scripting**: Bash shell for automation and logic
- **Linux Commands**: `mkdir`, `touch`, `chmod`, `sed`, file I/O operations
- **Text Processing**: `sed`, `grep`, and other text manipulation tools
- **File System Management**: Directory creation and permission handling

## 📋 Prerequisites

- Linux or Unix-based operating system
- Bash shell (version 4.0 or higher)
- Basic command-line knowledge
- Git for version control

## 🔧 Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/intwaza/submission_reminder_app_intwaza.git
   cd submission_reminder_app_intwaza
   ```

2. **Make scripts executable**
   ```bash
   chmod +x create_environment.sh
   chmod +x copilot_shell_script.sh
   ```

3. **Run the environment setup**
   ```bash
   ./create_environment.sh
   ```
   - Enter your name when prompted
   - The script will create `submission_reminder_{yourName}` directory

4. **Navigate to your application directory**
   ```bash
   cd submission_reminder_{yourName}
   ```

## 💡 How to Use

### Initial Setup and Testing
1. **Run the environment creation script**
   ```bash
   ./create_environment.sh
   ```
   - Follow the prompts to enter your name
   - Wait for the complete directory structure to be created

2. **Test the application**
   ```bash
   cd submission_reminder_{yourName}
   ./startup.sh
   ```
   - This will show current submission status for all students

### Changing Assignment Configuration
1. **Run the copilot script**
   ```bash
   ./copilot_shell_script.sh
   ```
   - Enter the new assignment name when prompted
   - The script will update the configuration automatically

2. **View updated results**
   - The application will automatically rerun with the new assignment settings
   - Check which students haven't submitted for the new assignment

## 📁 Application Directory Structure

When you run `create_environment.sh`, it creates the following structure:

```
submission_reminder_{yourName}/
├── app/
│   ├── reminder.sh          # Main reminder logic
│   └── functions.sh         # Helper functions
├── modules/
│   └── functions.sh         # Additional function modules
├── assets/
│   └── submissions.txt      # Student submission data
├── config/
│   └── config.env          # Application configuration
├── logs/
└── startup.sh              # Application startup script
```

## 🎯 Key Components

### 1. Environment Setup Script (`create_environment.sh`)
- Prompts for user input
- Creates complete directory structure
- Populates all required files with appropriate content
- Sets executable permissions on shell scripts
- Includes at least 5 additional student records for testing

### 2. Configuration Management (`copilot_shell_script.sh`)
- Prompts for new assignment name
- Uses `sed` to update `config/config.env`
- Replaces the ASSIGNMENT value dynamically
- Reruns the application with new settings

### 3. Application Files (Auto-generated)
- **reminder.sh**: Core reminder functionality
- **functions.sh**: Utility functions
- **config.env**: Environment configuration
- **submissions.txt**: Student submission data
- **startup.sh**: Application entry point

## 🔄 Git Workflow

This project follows a structured branching strategy:

- **Feature Branch**: `feature/setup` - Used for development and testing
- **Main Branch**: `main` - Contains only the final deliverables:
  - `create_environment.sh`
  - `copilot_shell_script.sh`
  - `README.md`

## 🧪 Testing

1. **Test Environment Creation**
   ```bash
   ./create_environment.sh
   # Verify all directories and files are created
   ```

2. **Test Application Functionality**
   ```bash
   cd submission_reminder_{yourName}
   ./startup.sh
   # Check if reminder system works correctly
   ```

3. **Test Configuration Changes**
   ```bash
   ./copilot_shell_script.sh
   # Enter a new assignment name and verify updates
   ```

## 🐛 Troubleshooting

### Common Issues
- **Permission Denied**: Make sure scripts are executable using `chmod +x`
- **Command Not Found**: Ensure you're running scripts from the correct directory
- **Config Updates Not Working**: Check that `config/config.env` exists and is writable

### Error Handling
- Scripts include error checking for file operations
- Validates user input before processing
- Provides clear error messages for common issues


## 👨‍💻 Author

**Intwaza**
- GitHub: [@intwaza](https://github.com/intwaza)

## 🙏 Acknowledgments

- Linux shell scripting community for best practices
- Assignment guidelines for application structure requirements
- Testing feedback for improved error handling

---

**Note**: This project shows how to write cool computer commands (called shell scripts) that help you set things up and keep things organized. It's a fun way to learn how Linux works and how to make your computer do things automatically!
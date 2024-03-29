#!/bin/bash

# Get the current time and add 1 minute
startTime=$(date -v +1M "+%H:%M")

# Path to your Bash script (formerly beep.sh)
scriptPath="$(dirname "$0")/playsound_mac.sh"

# Create a Launchd Property List (.plist) file
plistContent=$(cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>com.example.playsound_mac</string>
    <key>ProgramArguments</key>
    <array>
      <string>playsound_mac.sh</string>
    </array>
    <key>StartInterval</key>
    <integer>30</integer>
  </dict>
</plist>
EOF
)

# Save the plist to a file
plistPath="/Library/LaunchAgents/com.example.playsound_mac.plist"
sudo echo "$plistContent" > "$plistPath"
echo "$plistContent" 
echo "$plistPath"

chmod +r "$plistPath"


# Load the task into Launchd
launchctl load "$plistPath"

# Inform the user about the scheduled task
echo "Playsound_mac task scheduled to run at $startTime"

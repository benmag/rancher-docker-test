#!/bin/bash

# Copy env vars to env.conf file for nginx
/bin/bash /copyenv

# Run build commands
/bin/bash $BUILD_COMMANDS

# Start nginx 
/bin/bash /start.sh
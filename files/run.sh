#!/bin/bash

# Copy env vars to env.conf file for nginx
/bin/bash /copyenv

# Run build commands
eval $BUILD_COMMANDS

# Start nginx 
/bin/bash /start.sh
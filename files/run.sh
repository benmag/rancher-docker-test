#!/bin/bash

# Copy env vars to env.conf file for nginx
/bin/bash /copyenv

# Run build commands
echo " ---> Executing build commands"
if eval $BUILD_COMMANDS
then
	echo " ---> Successfully executed build commands"
else 
	echo ERROR: Failed to execute build commands
	exit 1 # terminate and inidcate error
fi

# Start nginx 
/bin/bash /start.sh
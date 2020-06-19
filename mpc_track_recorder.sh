#!/bin/bash

#############################################
# The MPC track recorder                    #
# Starts a small web server on port 10,000  #
# which, when accessed, will list the last  #
# 10 tracks which are listed in the         #
# ~/tracklist file. Then, it will start a   #
# loop to record these tracks.              #
#############################################

#!/bin/bash

trackrecorder(){
	while :
	do
		TIMESTAMP=$(date +"%m/%e %H:%M:%S")
		TRACK=$(mpc current --wait)
		echo "$TIMESTAMP: $TRACK">>/home/sal/trackhistory
		sleep 10 # This is in case mpd dies
	done
}

nc -lk -p 10000 --sh-exec "echo -e 'HTTP/1.1 200 OK\r\n'; tail /home/sal/trackhistory; echo '--------------------------------------'; mpc; echo '--------------------------------------'; mpc stats; mpc queued" &

nc -lk -p 10001 --sh-exec "/usr/bin/mpc next" &

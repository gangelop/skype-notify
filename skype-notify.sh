#!/bin/sh

# USAGE:
# tell skype to execute the following line on any event:
# skype-notif.sh "%type" "%sskype" "%sname" "%smessage" "%fname" "%fpath" "%fsize"


# read arguments
TYPE=$1
USERNAME=$2
CONTACT=$3
MSG=$4
FNAME=$5
FPATH=$6
FSIZE=$7


notify-send "skype - $TYPE" "username: $USERNAME\ncontact: $CONTACT\nmsg: $MSG\nfname: $FNAME\nfpath: $FPATH\nfsize: $FSIZE"

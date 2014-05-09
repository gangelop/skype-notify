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

TITLE=''
BODY=''
URGENCY="normal"

case "$TYPE" in

    ChatIncoming)
        TITLE="$CONTACT"
        BODY="$MSG"
    ;;

    ContactOnline)
        TITLE="$CONTACT"
        BODY='appeared online'
        URGENCY='low'
    ;;

    ContactOffline)
        TITLE="$CONTACT"
        BODY='gone offline'
        URGENCY='low'
    ;;

    CallRingingIn)
        TITLE="$CONTACT"
        BODY='incoming call'
        URGENCY='critical'
    ;;

    *)
        SAY_NOTHING=true
    ;;

esac




#notify-send "skype - $TYPE" "username: $USERNAME\ncontact: $CONTACT\nmsg: $MSG\nfname: $FNAME\nfpath: $FPATH\nfsize: $FSIZE"

[ $SAY_NOTHING == true ] || notify-send --urgency $URGENCY \
                                        --icon skype \
                                        "skype - $TITLE" "$BODY"
#notify-send "$TYPE"

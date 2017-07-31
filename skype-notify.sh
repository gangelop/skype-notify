#!/bin/sh

# USAGE:
# tell skype to execute the following line on any event:
# skype-notify.sh "%type" "%sskype" "%sname" "%smessage" "%fname" "%fpath" "%fsize"


# read arguments
TYPE=$1
USERNAME=$2
CONTACT=$3
MSG=$4
FNAME=$5
FPATH=$6
FSIZE=$7
STRING_FILE="$HOME/.config/skype-notify.strings"

TITLE=''
BODY=''
URGENCY="normal"

case "$TYPE" in

    ChatIncoming)
        # ugly hack
        # Since skype 4.3, when the chang window is focused,
        # a 'ChatIncoming' type event is generated but there is no
        # '%smessage' which messes up the notification. This little check
        # just suppresses the faulty notification in this case.
        [ "$MSG" = "%fname" ] && SAY_NOTHING=true
        # end ugly hack

        # since skype 4.3, the contact name is included in the %smessage
        # which is silly. I'd rather have it in the title but
        # we'll roll with it.
        TITLE=""
        BODY="$MSG"
    ;;

    ContactOnline)
        TITLE=" - $CONTACT"
        BODY='● appeared online'
        URGENCY='low'
    ;;

    ContactOffline)
        TITLE=" - $CONTACT"
        BODY='○ gone offline'
        URGENCY='low'
    ;;

    CallRingingIn)
        TITLE=" - $CONTACT"
        BODY='incoming call'
        URGENCY='critical'
    ;;

    *)
        SAY_NOTHING=true
    ;;

esac


echo "$MSG" | grep -i -f "$STRING_FILE" && URGENCY=critical


[ "$SAY_NOTHING" = true ] || notify-send -i skype --urgency $URGENCY \
                                        --icon skype \
                                        "skype$TITLE" "$BODY"

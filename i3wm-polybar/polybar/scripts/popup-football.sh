#!/bin/bash

TMP=${XDG_RUNTIME_DIR:-/tmp}/"$UID"_footballscore_notification
touch "$TMP"

DIFF=${DIFF:-0}

send_notification() {
	BODY=$(fbs "-k=xxx" "-c=xxx" "--next-match=1" | head -n7)
	dunstify -h string:x-canonical-private-synchronous:footballscore \
		"$BODY" -u NORMAL
}

send_notification "$DIFF"

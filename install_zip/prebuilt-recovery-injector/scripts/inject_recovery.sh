#!/sbin/sh
RECOVERY_DEV="$(cat /tmp/recoverydev)"

if [ ! -e "$RECOVERY_DEV" ]; then
    echo "RECOVERY_DEV \"$RECOVERY_DEV\" does not exist!"
    return 1
fi

base=""
if [ -d "/data/media/multirom" ] ; then
    base="/data/media/multirom"
elif [ -d "/data/media/0/multirom" ] ; then
    base="/data/media/0/multirom"
else
    if [ -d "/data/media/0" ] ; then
        base="/data/media/0/multirom"
    else
        base="/data/media/multirom"
    fi
fi

$base/trampoline --inject="$RECOVERY_DEV" --mrom_dir="$base" -f
return $?

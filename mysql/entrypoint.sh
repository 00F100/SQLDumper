#!/bin/sh

if [ "$DUMPER_ACTION" = "restore" ]; then
    mysql -h$DUMPER_HOST -P$DUMPER_PORT -u$DUMPER_USERNAME -p$DUMPER_PASSWORD $DUMPER_SCHEMA < "/var/dump/$DUMPER_FILENAME";
else
    mysqldump --compact --single-transaction --routines -h$DUMPER_HOST -P$DUMPER_PORT -u$DUMPER_USERNAME -p$DUMPER_PASSWORD $DUMPER_SCHEMA > "/tmp/$DUMPER_FILENAME";
    if [ "$DUMPER_COMPACT" = "true" ]; then
        tar -czvf "$DUMPER_FILENAME.tar.gz" "/tmp/$DUMPER_FILENAME";
        mv "/tmp/$DUMPER_FILENAME.tar.gz" "/var/dump/$DUMPER_FILENAME.tar.gz";
    else
        mv "/tmp/$DUMPER_FILENAME" "/var/dump/$DUMPER_FILENAME";
    fi
fi
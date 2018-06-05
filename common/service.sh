#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

echo "Excecuted on $(date +"%d-%m-%Y %r")" >> $MODDIR/startup.log

delayed_dd()
{
    sleep 5
    dd of=/dev/block/bootdevice/by-name/persistent if=$MODDIR/common/persistent-backup.img 2>> $MODDIR/startup.log
    echo "dd on $(date +"%d-%m-%Y %r")" >> $MODDIR/startup.log
}

delayed_dd &

echo "start on $(date +"%d-%m-%Y %r")" >> $MODDIR/startup.log
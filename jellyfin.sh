#!/bin/bash
JELLYFINDIR="/opt/jellyfin"
FFMPEGDIR="/usr/share/jellyfin-ffmpeg"

$JELLYFINDIR/jellyfin \
 -d $JELLYFINDIR/config/data \
 -C $JELLYFINDIR/config/cache \
 -c $JELLYFINDIR/config/config \
 -l $JELLYFINDIR/config/log \
 --ffmpeg $FFMPEGDIR/ffmpeg

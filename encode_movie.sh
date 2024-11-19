#!/bin/sh

pat=i
dir=.
file=title.mp4
if [ ! -z "$1" ] ; then
	if [ -d "$1" ] ; then
		dir=${1%/}
		file=${dir#movie_}.mp4
	fi
fi

if [ -n "$(find $dir -name 'o_*png' -print -quit)" ] ; then
	pat=o
fi

[ -f $file ] && rm $file
#avconv -r 24 -i o_%04d.png -r 24 -vcodec libx264 -crf 20 -g 15 $file
ffmpeg -hide_banner -v warning -stats -f image2 -framerate 24 -i ${dir}/${pat}_%04d.png -vcodec libx264 -crf 20 $file
du -sh $file

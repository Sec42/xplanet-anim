#!/bin/bash

dir=.
if [ ! -z "$1" ] ; then
	if [ -d "$1" ] ; then
		dir=${1%/}
	fi
fi

find $dir -name "i_*.png" -print |sort|while read in ; do 
 of=$dir/o_${in#*/i_}
 if [ ! -f $of ] ; then
	 j=$(jobs|wc -l)
 echo $in "->" $of "[$j]"

convert $in -font "-*-fixed-*-r-*-*-*-500-*-*-*-*-iso8859-*"  -weight 100 -pointsize 80 \
-draw "gravity northwest fill white text 30,0 'Iridium'" \
-draw "gravity northwest fill white text 30,60 'System'" \
-draw "gravity northwest fill white text 30,125 'Hacking'" \
-draw "gravity southeast fill white text 10,60 'Sec'" \
-draw "gravity southeast fill white text 10,0 'schneider'" \
$of &
	while [[ $j -gt 19 ]] ; do
	  wait -n
	  j=$(jobs|wc -l)
	done
 fi

done

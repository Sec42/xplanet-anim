#!/bin/bash

dt=`date --date 'TZ="Europe/Berlin" 2024-12-28 13:45:00' +%s`
int=15
ctr=0

dir=movie_$$
dir=movie_$(date +%Y%m%dT%H%M%S)

[ -d $dir ] || mkdir $dir

while true ; do 

dt=`echo $dt + $int |bc`
ds=`date --date="@$dt" +%Y%m%d.%H%M%S`

ctr=`echo $ctr + 1 | bc`
cctr=`printf %04d $ctr`
file=$dir/i_$cctr.png

echo Rendering $ds to $file

xplanet -lat 48 -lon 11 -searchdir . -radius 45 -geometry 1600x900 -font fonts/pf_tempesta_seven.ttf -fontsize 10 -pango -output $file  -num_times 1 -date $ds 2>/dev/null & 

while [ $(jobs |wc -l) -gt 19 ] ; do
  sleep .1
done

done

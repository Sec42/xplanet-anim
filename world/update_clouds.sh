#!/bin/sh

dt=$(date -Iminutes)
fn1="${dt}-clouds.jpg"
fn2="${dt}-specular.jpg"

# available: 8192x4096 4096x2048 2048x1024 or 1024x512
res=8192x4096
curl -sSo world/${fn1} -z world/${fn1} https://clouds.matteason.co.uk/images/${res}/clouds.jpg
curl -sSo world/${fn2} -z world/${fn2} https://clouds.matteason.co.uk/images/${res}/specular.jpg

#ln -fs "${fn1}" world/clouds.jpg
#ln -fs "${fn2}" world/specular.jpg

# NASA earth is 5400x2700
convert -resize 5400x2700 world/$fn1 world/clouds.jpg
convert -resize 5400x2700 world/$fn2 world/specular.jpg

month=$(date +%m)
ln -fs earth_${month}.jpg world/earth.jpg



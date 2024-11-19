dt=$(date -Iminutes)
fn="${dt}-iridium.tle"

curl -sSo "satellites/$fn" 'https://celestrak.org/NORAD/elements/gp.php?GROUP=iridium-NEXT&FORMAT=tle'

sat=$(grep -c '^IRIDIUM' satellites/$fn)
echo "${sat} satellites fetched in $fn"

ln -fs "${fn}" satellites/iridium.tle
sh satellites/mk_marker < satellites/$fn >satellites/${fn%.tle}
ln -fs "${fn%.tle}" satellites/iridium



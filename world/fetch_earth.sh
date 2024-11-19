cd world

# NASA Visible Earth / Blue Marble Images from 2004

URL="https://neo.gsfc.nasa.gov/archive/bluemarble/bmng"

echo "Earth (12):"
for m in $(seq -w 12) ; do
[ -e earth_${m}.jpg ] || curl -#o earth_${m}.jpg "$URL/world_8km/world.topo.bathy.2004${m}.3x5400x2700.jpg"
done

echo "Specular/Bump (2):"
# Specular map for reflections
[ -e specular-nasa.jpg ] || curl -#o specular-nasa.jpg $URL/topography/gebco_bathy.5400x2700.jpg
# Bump map for relief
[ -e bump.jpg ] || curl -#o bump.jpg $URL/topography/srtm_ramp2.world.5400x2700.jpg


URL="https://neo.gsfc.nasa.gov/archive/blackmarble"

echo "Night (2):"
# Night view of earth 2012
[ -e night-2012.jpg ] || curl -#o night-2012.jpg $URL/2012/global/BlackMarble_2012_3km.jpg
#convert -resize 5400x2700 night-2016.jpg night.jpg

# Night view of earth 2016
[ -e night-2016.jpg ] || curl -#o night-2016.jpg $URL/2016/global/BlackMarble_2016_3km.jpg
convert -resize 5400x2700 night-2016.jpg night.jpg


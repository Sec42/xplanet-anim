# Scripts to make animations with xplanet

0. Required packages

```
apt-get install xplanet imagemagick
```

1. download initial assets

```
./fonts/fetch_font.sh
./world/fetch_earth.sh
```

2. download time variable assets

```
./satellites/update_tle.sh
./world/update_clouds.sh
```

3. make movie

```
./make_images.sh            # ^c once you have enough frames
./render_title.sh movie_XXX # only if you want to add text
./encode_movie.sh movie_XXX
```

## editable things
### render_title.sh
* Title text & position
* Title font
### make_images.sh
* Location (lat/lon)
* Start time
* "speed"
### default
* cloud_gamma
### satellites/mk_marker
* satellite trail length
* satellite color
* satellite text size


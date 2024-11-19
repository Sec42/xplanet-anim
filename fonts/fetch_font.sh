#!/bin/sh
font=pf_tempesta_seven
curl -sSo fonts/${font}.zip -o fonts/${font}.zip https://dl.dafont.com/dl/?f=${font}
unzip -j -o -d fonts fonts/${font}.zip

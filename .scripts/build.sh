#!/bin/sh
# Builds the addon like the release builder an deploys to WoW addon folder.
echo "Executing a $0"

# Check .env
if [ -f ".env" ]; then
 . "./.env"
elif [[ -f ".scripts/.env" ]]; then
   . ".scripts/.env"
else
   echo "<WARNING> Couldn't find \".env\" file. This should contain a WOW_LOCATION variable with the game path.">&2
fi

# Fetch release script
release_script=$(curl -s "https://raw.githubusercontent.com/BigWigsMods/packager/master/release.sh")

# Package addon(s)
echo "$release_script" | bash -s -- -r "$(pwd)/.tmp/Retail" -dolz
echo "$release_script" | bash -s -- -r "$(pwd)/.tmp/Classic" -dolz -g 1.13.4

# Copy to WoW addons
ADDON_LOC="$(pwd)"
ADDON="$(basename $ADDON_LOC)"
DEST="$WOW_LOCATION/_retail_/Interface/AddOns/$ADDON"
robocopy "./.tmp/Retail/$ADDON" "$DEST" //s //purge //XD .* __*  //XF ?.* __* //NFL //NDL //NJH

DEST="$WOW_LOCATION/_classic_/Interface/AddOns/$ADDON"
robocopy "./.tmp/Classic/$ADDON" "$DEST" //s //purge //XD .* __*  //XF ?.* __* //NFL //NDL //NJH

# # And delete .tmp
rm -r "./.tmp"

read

#!/data/data/com.termux/files/usr/bin/sh
# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
apt-get update
apt-get --yes upgrade
apt-get --yes install coreutils gnupg
# Make the sources.list.d directory
mkdir -p $PREFIX/etc/apt/sources.list.d
# Write the needed source file
echo "deb https://botter-nidnul.github.io/urbit-android.deb/apt termux custom" > $PREFIX/etc/apt/sources.list.d/urbit-android.list
# Add signing key from https://its-pointless.github.io/pointless.gpg
if [ -n $(command -v curl) ]; then
curl -sL https://botter-nidnul.github.io/urbit-android.deb/public.gpg | apt-key add -
elif [ -n $(command -v wget) ]; then
wget -qO - https://botter-nidnul.github.io/urbit-android.deb/public.gpg | apt-key add -
fi
# Update apt
apt-get update

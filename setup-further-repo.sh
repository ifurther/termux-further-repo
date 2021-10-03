
#!/data/data/com.termux/files/usr/bin/sh
# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
apt-get update
apt-get --assume-yes upgrade
apt-get --assume-yes install coreutils gnupg
# Make the sources.list.d directory
mkdir -p $PREFIX/etc/apt/sources.list.d
# Write the needed source file
if apt-cache policy | grep -q "termux.*24\|termux.org\|bintray.*24\|k51qzi5uqu5dg9vawh923wejqffxiu9bhqlze5f508msk0h7ylpac27fdgaskx" ; then
echo "deb https://ifurther.github.io/termux-further-repo/files/24 termux extras" > $PREFIX/etc/apt/sources.list.d/pointless.list
else
echo "deb https://ifurther.github.io/termux-further-repo/files/21 termux extras" > $PREFIX/etc/apt/sources.list.d/pointless.list
echo "deb https://ifurther.github.io/termux-further-repo/files/21 termux main" > $PREFIX/etc/apt/sources.list.d/pointless.list
fi
 Add signing key from https://its-pointless.github.io/pointless.gpg
if [ -n $(command -v curl) ]; then
curl -sLo $PREFIX/etc/apt/trusted.gpg.d/further.gpg --create-dirs https://ifurther.github.io/termux-further-repo/further.gpg
elif [ -n $(command -v wget) ]; then
wget -qP $PREFIX/etc/apt/trusted.gpg.d https://ifurther.github.io/termux-further-repo/further.gpg
fi
# Update apt
apt update

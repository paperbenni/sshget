#!/bin/bash

# download file using external server with good internet
# requires wget and rsync on the server

if ! [ -e ~/.config/sshget/config.txt ]; then
    echo "please create ~/.config/sshget/config.txt"
    exit 1
fi

if [ -z "$1" ]; then
    echo "usage: sshget url"
    exit
fi

serveradress="$(cat ~/.config/sshget/config.txt)"
ssh "$serveradress" 'mkdir /tmp/sshget && cd /tmp/sshget && wget '"'$1'"
mkdir sshget
rsync -Pz "$serveradress":/tmp/sshget ./sshget || exit 1
mv ./sshget/* ./ || exit 1
rm -rf sshget
ssh "$serveradress" 'rm -rf /tmp/sshget'
echo "finished downloading $1"

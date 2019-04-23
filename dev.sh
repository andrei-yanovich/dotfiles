#!/bin/sh

set -o errexit
set -e

# Fail fast if we're not on OS X >= 10.6.0.

if [ "$(uname -s)" != "Darwin" ]; then
  echo "Sorry, DEV requires Mac OS X to run." >&2
  exit 1
fi

echo "*** Configurating dnsmasq..."
echo 'address=/.dev/0.0.0.0' > $(brew --prefix)/etc/dnsmasq.conf
echo 'address=/.local/0.0.0.0' >> $(brew --prefix)/etc/dnsmasq.conf

echo "*** Installing dnsmasq into LaunchDaemons..."
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'

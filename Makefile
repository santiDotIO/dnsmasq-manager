export HOSTNAME=$1;
# ----------------------
# Install
# ----------------------
brew install dnsmasq

# ----------------------
# Setup
# ----------------------
# Create config directory
mkdir -pv $(brew --prefix)/etc/
# Setup *.$HOSTNAME
echo 'address=/.$HOSTNAME/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf

# ----------------------
# Autostart
# ----------------------
# Work after reboot
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
# Get it going right now
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

# ----------------------
# Add to resolvers
# ----------------------
# Create resolver directory
sudo mkdir -v /etc/resolver
# Add your nameserver to resolvers
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/$HOSTNAME'

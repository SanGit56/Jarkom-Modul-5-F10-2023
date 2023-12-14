echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-relay -y

# ### FERN ###
# echo '
# SERVERS="192.226.0.18" # IP DHCP SERVER
# INTERFACES="eth0 eth1" # eth menuju client
# OPTIONS=' > /etc/default/isc-dhcp-relay
# echo '
# net.ipv4.ip_forward=1 ' > /etc/sysctl.conf
# service isc-dhcp-relay restart

# ### Himmel ###
# echo '
# SERVERS="192.226.0.18" # IP DHCP SERVER
# INTERFACES="eth0 eth1 eth2" # eth menuju client
# OPTIONS=' > /etc/default/isc-dhcp-relay
# echo '
# net.ipv4.ip_forward=1 ' > /etc/sysctl.conf
# service isc-dhcp-relay restart

# ### Frieren ###
# echo '
# SERVERS="192.226.0.18" # IP DHCP SERVER
# INTERFACES="eth0 eth1" # eth menuju client
# OPTIONS=' > /etc/default/isc-dhcp-relay
# echo '
# net.ipv4.ip_forward=1 ' > /etc/sysctl.conf
# service isc-dhcp-relay restart

# ### Aura ###
# echo '
# SERVERS="192.226.0.18" # IP DHCP SERVER
# INTERFACES="eth1 eth2" # eth menuju client
# OPTIONS=' > /etc/default/isc-dhcp-relay
# echo '
# net.ipv4.ip_forward=1 ' > /etc/sysctl.conf
# service isc-dhcp-relay restart

# ### Heiter ###
# echo '
# SERVERS="192.226.0.18" # IP DHCP SERVER
# INTERFACES="eth0 eth1 eth2" # eth menuju client
# OPTIONS=' > /etc/default/isc-dhcp-relay
# echo '
# net.ipv4.ip_forward=1 ' > /etc/sysctl.conf
# service isc-dhcp-relay restart
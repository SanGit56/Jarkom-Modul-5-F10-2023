echo 'nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install -y isc-dhcp-server

echo 'INTERFACES="eth0"' > /etc/default/isc-dhcp-server

echo 'subnet 192.226.0.16 netmask 255.255.255.252 {
}

subnet 192.226.0.128 netmask 255.255.255.128 {
    range 192.226.0.131 192.226.0.194;
    option routers 192.226.0.130;
    option broadcast-address 192.226.0.255;
    option domain-name-servers 192.226.0.14, 192.168.122.1;
    default-lease-time 600;
    max-lease-time 7200;
}

subnet 192.226.2.0 netmask 255.255.254.0 {
    range 192.226.2.2 192.226.3.0;
    option routers 192.226.2.1;
    option broadcast-address 192.226.3.255;
    option domain-name-servers 192.226.0.14, 192.168.122.1;
    default-lease-time 600;
    max-lease-time 7200;
}

subnet 192.226.8.0 netmask 255.255.248.0 {
    range 192.226.8.2 192.226.12.1;
    option routers 192.226.8.1;
    option broadcast-address 192.226.15.255;
    option domain-name-servers 192.226.0.14, 192.168.122.1;
    default-lease-time 600;
    max-lease-time 7200;
}

subnet 192.226.4.0 netmask 255.255.252.0 {
    range 192.226.4.3 192.226.6.4;
    option routers 192.226.4.1;
    option broadcast-address 192.226.7.255;
    option domain-name-servers 192.226.0.14, 192.168.122.1;
    default-lease-time 600;
    max-lease-time 7200;
}' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
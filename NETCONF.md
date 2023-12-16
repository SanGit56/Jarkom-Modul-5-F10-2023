## Konfigurasi Jaringan
### Aura
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.226.0.21
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 192.226.0.1
	netmask 255.255.255.252
```

### Frieren
```
auto eth0
iface eth0 inet static
	address 192.226.0.2
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 192.226.0.9
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 192.226.0.5
	netmask 255.255.255.252
```

### Stark
```
auto eth0
iface eth0 inet static
	address 192.226.0.6
	netmask 255.255.255.252
	gateway 192.226.0.5
```

### Himmel
```
auto eth0
iface eth0 inet static
	address 192.226.0.10
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 192.226.0.129
	netmask 255.255.255.128

auto eth2
iface eth2 inet static
	address 192.226.2.1
	netmask 255.255.254.0
```

### Fern
```
auto eth0
iface eth0 inet static
	address 192.226.0.130
	netmask 255.255.255.128

auto eth1
iface eth1 inet static
	address 192.226.0.17
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 192.226.0.13
	netmask 255.255.255.252
```

### Richter
```
auto eth0
iface eth0 inet static
	address 192.226.0.14
	netmask 255.255.255.252
	gateway 192.226.0.13
```

### Revolte
```
auto eth0
iface eth0 inet static
	address 192.226.0.18
	netmask 255.255.255.252
	gateway 192.226.0.17
```

### Heiter
```
auto eth0
iface eth0 inet static
	address 192.226.0.22
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 192.226.8.1
	netmask 255.255.248.0

auto eth2
iface eth2 inet static
	address 192.226.4.1
	netmask 255.255.252.0
```

### Sein
```
auto eth0
iface eth0 inet static
	address 192.226.4.2
	netmask 255.255.252.0
	gateway 192.226.4.1
```

### LaubHills, SchwerMountain, TurkRegion, GrobeForest
```
auto eth0
iface eth0 inet dhcp
```
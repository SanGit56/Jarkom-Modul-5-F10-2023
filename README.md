# Jarkom-Modul-5-F10-2023
Laporan resmi praktikum modul 5 firewall mata kuliah jaringan komputer

# Anggota
Kelompok: F10
Nama | NRP
--- | ---
Thoriq Afif Habibi | 5025211154
Radhiyan Muhammad Hisan | 5025211166

# Pembagian Subnet
Sebelum melakukan pembagian IP perlu dilakukan pembagian dan penamaan subnet terlebih dahulu. Penamaan bertujuan untuk mempermudah melakukan perhitungan. Berikut pembagian dan penamaan subnet yang menjadi dasar perhitungan _subnetting_:<br>
![tabel-subnet](./img/tabel-subnet.png)<br>
![pembagian-subnet](./img/subnet.jpeg)<br>
![tree vlsm](./F10_Tree-VLSM.jpg)

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

# ke Stark
auto eth2
iface eth2 inet static
	address 192.226.0.5
	netmask 255.255.255.252
```

### Stark
```
# ke Frieren
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